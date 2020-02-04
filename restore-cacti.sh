#!/bin/bash

#bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/restore-cacti.sh)

green=$(tput setaf 76)
red=$(tput setaf 1)
tan=$(tput setaf 3)
reset=$(tput sgr0)

printinfo() {
	printf "::: ${green}%s${reset}\n" "$@"
}

printwarn() {
	printf "${tan}*** WARNING: %s${reset}\n" "$@"
}

printerror() {
	printf "${red}*** ERROR: %s${reset}\n" "$@"
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

check-cacti() {
# check existing cacti installation
	test -f /var/www/html/cacti/include/cacti_version
	if [ $? -ne 1 ];then
		printinfo "Valid Cacti install found..."
	else
		printerror "Cacti is not already installed, cannot proceed."
		exit 1
	fi
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


# get file from param - list files for selection?
backupfile=backup_cacti-20200203.tar.gz
restorefolder=cacti_1.2.8
unpack-check() {
	printinfo "Unpacking backup..."
	tar -xzf ~/$backupfile
		if [ $? -ne 0 ];then
			printerror "Backup unpack error cannot restore, exiting..."
			exit 1
		else
			printinfo "Unpack success, moving on..."	
		fi
	test -e ~/$restorefolder/.cacti-backup
		if [ $? -ne 0 ];then
			printerror "Backup file not usable, cannot restore, exiting..."
		else
			printinfo "Backup file usable..."
		fi
}
# unzip file and check for .cacti-backup
# drop/restore mysql cacti db
# dump exiting rra and move backup rra
# check for proper file permissions

check-cacti
unpack-check

exit 0
