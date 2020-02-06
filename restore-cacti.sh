#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/restore-cacti.sh)

green=$(tput setaf 2)
red=$(tput setaf 1)
tan=$(tput setaf 3)
reset=$(tput sgr0)
errorcount=0
branch=master

printinfo() {
	printf "${tan}::: ${green}%s${reset}\n" "$@"
}

printwarn() {
	printf "${tan}*** WARNING: %s${reset}\n" "$@"
}

printerror() {
	printf "${red}!!! ERROR: %s${reset}\n" "$@"
}

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


# TODO: get file from param - list files for selection?
#backupfile=backup_cacti-1.2.3.tar.gz
selectBackup() {
		printinfo "The following Cacti Backup archives were found; select one:"

		# set the prompt used by select, replacing "#?"
		PS3="Use number to select a file or 'stop' to cancel: "

		# allow the user to choose a file
		select filename in backup_cacti-*.tar.gz
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
		bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/master/backup-cacti.sh) $1;;
		* ) 
		printwarn "Skipping backup of existing Cacti."
		;;
	esac
}

unpack-check() {
	printinfo "Unpacking backup..."
	tar -xzf ~/$backupfile
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
	restoreVersion=$( cat $restoreFolder/.cacti-backup )
		if [[ -z $restoreVersion ]];then
			restoreVersion=$( cat $restoreFolder/include/cacti_version )
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

# TODO: drop/restore mysql cacti db
drop-restore () {
	printinfo "Restoring Cacti DB..."
	gunzip $restoreFolder/mysql.cacti_*.sql.gz
	if [ $? -ne 0 ];then
		printerror "Backup DB not usable, cannot restore, exiting..."
		exit 1
	else
		sudo mysql -p cacti < $restoreFolder/mysql.cacti_*.sql
		if [ $? -ne 0 ];then
			printerror "Backup DB did not restore properly, exiting..."
			exit 1
		fi
	fi
}


# TODO: dump exiting rra and move backup rra
replace-rra () {
	printinfo "Restoring RRA data..."
	rm -rf /var/www/html/cacti/rra
	mv $restoreFolder/rra /var/www/html/cacti/
}

# Check file permissions
fix-permissions () {
	printinfo "Checking file permissions..."
	bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/master/update-permissions.sh)
}

# Cleaup files
cleanup-after () {
	printinfo "Cleaning up source files..."
	rm -rf $restoreFolder
}

check-cacti
selectBackup
backup-data
unpack-check
drop-restore
replace-rra
#fix-permissions
cleanup-after

# counter
	counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=restore-data&write=0 )
	
if [ $errorcount -ne 0 ];then
	printerror "Restoring Cacti did not complete successfully, you may be in an unstable state."
	exit 1
else
	printinfo "Cacti v$restoreVersion was successfully restored. You may now proceed to the web interface."
fi

exit $errorcount
