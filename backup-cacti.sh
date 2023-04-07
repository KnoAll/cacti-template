#!/bin/bash
# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/backup-cacti.sh) dev

green=$(tput setaf 2)
red=$(tput setaf 1)
tan=$(tput setaf 3)
reset=$(tput sgr0)
errorcount=0
branch=master
# Path to store the backup files
storepath=~/

printinfo() {
	if [ -z "$1" ]; then
		printf "${tan}::: ${green}%s${reset}\n" "$@"
	else
		printf "${tan}::: ${green}%s${reset}\n" "$(date +%a_%R): $@"
	fi	
}
printwarn() {
	printf "${tan}*** WARNING: %s${reset}\n" "$(date +%a_%R): $@"
}
printerror() {
	printf "${red}!!! ERROR: %s${reset}\n" "$(date +%a_%R): $@"
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

function locationAsk() {
	read -p "Backup will be stored in $storepath, do you want to select a different location? [y/N] " yn
	case "$yn" in
		y | Y | yes | YES| Yes ) 
			read -p "Enter the full path of an already existing directory: " storepath
			printinfo "Backup directory now $storepath..."
			printinfo
		;;
	esac
}

backupData() {
                printinfo "Grabbing Cacti db..."
                cactiver=$( cat /var/www/html/cacti/include/cacti_version )
                mkdir /"$storepath"/cacti_$cactiver
                mysqldump --user=cacti --password=cacti -l --add-drop-table cacti > /"$storepath"/cacti_$cactiver/mysql.cacti_$(date +\%Y\%m\%d).sql
		if [[ $? -ne 0 ]];then
			printwarn "Error backing up default Cacti db, trying to backup alternate db cactimain"
			mysqldump --user=cacti --password=cacti -l --add-drop-table cactimain > /"$storepath"/cacti_$cactiver/mysql.cacti_$(date +\%Y\%m\%d).sql
			if [[ $? -ne 0 ]];then
				printerror "Error backing up alternate Cacti db cactimain, DATABASE NOT BACKED UP! You should back up manually."
			else
				gzip /"$storepath"/cacti_$cactiver/mysql.cacti_$(date +\%Y\%m\%d).sql
				if [[ $? -ne 0 ]];then
					printerror "Cacti db NOT BACKED UP!"
				else
					printinfo "Cacti db backed up."
				fi				
			fi
		else
		gzip /"$storepath"/cacti_$cactiver/mysql.cacti_$(date +\%Y\%m\%d).sql
			if [[ $? -ne 0 ]];then
				printerror "Cacti database NOT BACKED UP! You should backup the db manually."
			else
				printinfo "Cacti db backed up."
			fi
		fi
		printinfo "Grabbing configs, RRA files, resources, scripts, etc...."
                [ -e "$file" ]
		rsync -raq /var/www/html/cacti/resource /"$storepath"/cacti_$cactiver/
		rsync -raq /var/www/html/cacti/scripts /"$storepath"/cacti_$cactiver/
		rsync -raq /var/www/html/cacti/include/themes /"$storepath"/cacti_$cactiver/
		cp /var/www/html/cacti/include/config.php /"$storepath"/cacti_$cactiver
		cp /usr/local/spine/etc/spine.conf /"$storepath"/cacti_$cactiver
		echo $cactiver > /"$storepath"/cacti_$cactiver/.cacti-backup
		printinfo
		backupSmokePing
		printinfo "Compressing files..."
                tar -pczf /"$storepath"/backup_cacti-$cactiver_$(date +\%Y\%m\%d).tar.gz -C /"$storepath"/ cacti_$cactiver
		printinfo "Removing temp files..."
		rm -rf /"$storepath"/cacti_$cactiver
		printinfo "Cacti v$cactiver backed up into /"$storepath"/backup_cacti-$cactiver_$(date +\%Y\%m\%d).tar.gz"
}

backupSmokePing() {
	printwarn "checking smokeping"
	if [ -e /opt/smokeping/bin/smokeping ]; then
		printwarn "smokeping found, backing up"
		rsync -raq /opt/smokeping /"$storepath"/cacti_$cactiver/
	fi
}

#ingest options
if [[ "$#" > 0 ]]; then
	for var in "$@"; do
	    case $var in
		debug|-debug|--debug)
			trap 'echo cmd: "$BASH_COMMAND" on line $LINENO exited with code: $?' DEBUG
			printwarn "Now DEBUGGING"
		;;
		dev|-dev|--dev|--switch-dev)
			branch=dev
			printwarn "Now on DEV branch."
		;;
		--pick-location)
			locationAsk
		;;
	    esac
	done
else
	counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=backup-data&write=0 )
	branch=master
fi

backupData
exit 0
