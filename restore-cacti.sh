#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/restore-cacti.sh)

green=$(tput setaf 2)
red=$(tput setaf 1)
tan=$(tput setaf 3)
reset=$(tput sgr0)
branch=master
storepath=~/

printinfo() {
	printf "${tan}::: ${green}%s${reset}\n" "$@"
}

printwarn() {
	printf "${tan}*** WARNING: %s${reset}\n" "$@"
}

printerror() {
	printf "${red}!!! ERROR: %s${reset}\n" "$@"
}

function locationAsk() {
	read -p "Backups are by default stored in the home directory, do you want to select a different location? [y/N] " yn
	case "$yn" in
		y | Y | yes | YES| Yes ) 
printwarn $storepath
			read -p "Enter the full path of an already existing directory: " storepath
printwarn $storepath
		;;
	esac
}

# error handling
#set -eE
exit_trap() {
		local lc="$BASH_COMMAND" rc=$?
		if [ $rc -ne 0 ]; then
		printerror "Command [$lc] on $LINENO exited with code [$rc]"
		fi
}
#trap exit_trap EXIT

case $(whoami) in
        root)
		printerror "You ran me as root! Do not run me as root!"
		exit 1
		;;
        pi)
		printerror "You ran me as pi user! Do not run me as pi!"
		exit 1
                ;;
        cacti)       
		;;
        *)
		printerror "Uh-oh. You are not logged in as the cacti user. Exiting..."
		exit 1
                ;;
esac

printwarn "Beginning Cacti data restore process..."

check-cacti() {
# check existing cacti installation
	test -f /var/www/html/cacti/include/cacti_version
	if [ $? -ne 1 ];then
		printinfo "Valid Cacti install found..."
	else
		printerror "Cacti is not already installed, cannot proceed."
		exit 1
	fi

}

selectBackup() {
		cd $storepath
		if $( test -f backup_cacti-*.tar.gz ); then
			printinfo "The following Cacti Backup archives were found; select one:"
			files=$( ls backup_cacti-*.tar.gz )
		else
			printerror "No Cacti backup files found, exiting..."
			exit 1
		fi

		# set the prompt used by select, replacing "#?"
		PS3="Use number to select a file or 'stop' to cancel: "

		# allow the user to choose a file
		select filename in $files
		do
		    # leave the loop if the user says 'stop'
		    if [[ "$REPLY" == stop ]]; then break;
		    	printerror "Cannot restore as no file was selected, exiting..."
			exit 1
		    fi

		    # complain if no file was selected, and loop to ask again
		    if [[ "$filename" == "" ]]
		    then
			echo "'$REPLY' is not a valid number"
			continue
		    fi

		    # now we can use the selected file
		    backupfile=$filename

		    # it'll ask for another unless we leave the loop
		    break
		done
}

backup-data() {
# backup existing cacti data?
	read -p "Do you want to backup existing Cacti install before restoring over top? [y/N] " yn
	case "$yn" in
		y | Y | yes | YES| Yes ) printinfo "Ok, let's go!"
		counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=backup-data&write=0 )
		bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/backup-cacti.sh) $1;;
		* ) 
		printwarn "Skipping backup of existing Cacti."
		;;
	esac
}

unpack-check() {
	printinfo "Unpacking backup..."
	cd $storepath
	tar -xzf /"$storepath"/$backupfile
		if [ $? -ne 0 ];then
			printerror "Backup unpack error cannot restore, exiting..."
			exit 1
		fi
	restoreFolder=$( find . -type f -name '.cacti-backup' | sed -r 's|/[^/]+$||' )
		if [[ -z $restoreFolder ]];then
			restoreFolder=$( find . -type f -name 'cacti_version' | sed -r 's|/[^/]+$||' | sed -r 's|/[^/]+$||' )
			if [[ -z $restoreFolder ]];then
				restoreFolder=$( find . -type f -name 'mysql.cacti_*.sql.gz' | sed -r 's|/[^/]+$||' )
				if [[ -z $restoreFolder ]];then
					printerror "Backup file not usable. Leaving unpacked files in $restoreFolder in place."
					exit 1
				else
					printwarn "Old backup found, but Cacti version cannot be verified."
					read -p "Do you want to try to restore this unknown version? [y/N] " yn
					case "$yn" in
						y | Y | yes | YES| Yes ) printinfo "OK, moving on..."
						;;
						* ) 
						printerror "NOT restoring Cacti. Leaving unpacked files in $restoreFolder in place."
						exit 1
						;;
					esac
				fi
			fi
		fi

# check for version to be restored
	restoreVersion=$( cat /"$storepath"/$restoreFolder/.cacti-backup )
		if [[ -z $restoreVersion ]];then
			restoreVersion=$( cat /"$storepath"/$restoreFolder/include/cacti_version )
			if [[ -z $restoreVersion ]];then
				printerror "Cannot verify backup for automated restore, leaving unpacked files in $restoreFolder in place. You can check Kevin's FAQ for info."
				exit 1
			fi
		fi

	read -p "Cacti v$restoreVersion found, is that what you want to restore? [y/N] " yn
	case "$yn" in
		y | Y | yes | YES| Yes ) 
		read -p "Are you REALLY sure you want to restore? This will destructively overwrite the existing Cacti installation and is irreversible. [y/N] " yn
			case "$yn" in
				y | Y | yes | YES| Yes ) printinfo "Restoring Cacti v$restoreVersion from backup..."
				;;
				* ) 
				printerror "NOT restoring Cacti v$restoreVersion. Leaving unpacked files in $restoreFolder in place."
				exit 1
				;;
			esac
		;;
		* ) 
		printerror "NOT restoring Cacti v$restoreVersion. Leaving unpacked files in $restoreFolder in place."
		exit 1
		;;
	esac
}

drop-restore () {
	printinfo "Restoring Cacti DB..."
	gunzip /"$storepath"/$restoreFolder/mysql.cacti_*.sql.gz
	if [ $? -ne 0 ];then
		printerror "Backup DB not usable, cannot restore, exiting..."
		exit 1
	else
		sudo mysql -p cacti < /"$storepath"/$restoreFolder/mysql.cacti_*.sql
		if [ $? -ne 0 ];then
			printerror "Backup DB did not restore properly, exiting..."
			exit 1
		fi
	fi
}

replace-rra () {
	printinfo "Restoring RRA data..."
	rm -rf /var/www/html/cacti/rra
	mv /"$storepath"/$restoreFolder/rra /var/www/html/cacti/
}

restore-config () {
	printinfo "Restoring Config..."
	mv /"$storepath"/$restoreFolder/config.php /var/www/html/cacti/include/
	sudo mv /"$storepath"/$restoreFolder/spine.conf /usr/local/spine/etc/
}

# Check file permissions
fix-permissions () {
	printinfo "Checking file permissions..."
	bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/update-permissions.sh)
}

# Cleaup files
cleanup-after () {
	printinfo "Cleaning up source files..."
	rm -rf /"$storepath"/$restoreFolder
}

check-cacti

#ingest options
if [[ "$#" > 0 ]]; then
	for var in "$@"; do
	    case $var in
		debug|-debug|--debug)
			trap 'echo cmd: "$BASH_COMMAND" on line $LINENO exited with code: $?' DEBUG
			printwarn "Now DEBUGGING"
		;;
		dev|-dev|--dev)
			branch=dev
			printwarn "Now on DEV branch."
		;;
		--pick-location)
			locationAsk
		;;
		*)
			branch=master
		;;
	    esac
	done
else
	counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=restore-data&write=0 )
	branch=master
fi

selectBackup
unpack-check
backup-data
drop-restore
replace-rra
if [ -f  /"$storepath"/$restoreFolder/config.php ]; then
	restore-config	
fi
#fix-permissions
cleanup-after
	
printinfo "Cacti v$restoreVersion was successfully restored. You may now proceed to the web interface."

exit
