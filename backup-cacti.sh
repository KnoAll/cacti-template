#!/bin/bash

#bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/backup-cacti.sh)

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

# error handling
exit_on_error() {
    exit_code=$1
    last_command=${@:2}
    if [ $exit_code -ne 0 ]; then
        printerror "${last_command} command failed with exit code ${exit_code}."
        exit $exit_code
    fi
}

# enable !! command completion
set -o history -o histexpand

backupData() {
                printinfo "Grabbing Cacti db and data and packaging..."
                cactiver=$( cat /var/www/html/cacti/include/cacti_version )
                mkdir cacti_$cactiver
                mysqldump --user=cacti --password=cacti -l --add-drop-table cacti |gzip > ~/cacti_$cactiver/mysql.cacti_$(date +\%Y\%m\%d).sql.gz
		exit_on_error $? !!
                cp -R /var/www/html/cacti/rra ~/cacti_$cactiver/rra
		exit_on_error $? !!
		rsync -raq /var/www/html/cacti/resource ~/cacti_$cactiver/
		exit_on_error $? !!
		rsync -raq /var/www/html/cacti/scripts ~/cacti_$cactiver/
		exit_on_error $? !!
		rsync -raq /var/www/html/cacti/include/themes ~/cacti_$cactiver/
		exit_on_error $? !!
		cp /var/www/html/cacti/include/config.php ~/cacti_$cactiver
		exit_on_error $? !!
		cp /usr/local/spine/etc/spine.conf ~/cacti_$cactiver
		exit_on_error $? !!
		echo $cactiver > cacti_$cactiver/.cacti-backup
		exit_on_error $? !!
                tar -pczf ~/backup_cacti-$cactiver_$(date +\%Y\%m\%d).tar.gz -C ~/ cacti_$cactiver
		exit_on_error $? !!
		rm -rf cacti_$cactiver
		exit_on_error $? !!
}

backupData
exit 0
