#!/bin/bash

#bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/backup-cacti.sh)

case $(whoami) in
        root)
		echo -e "\033[31m You ran me as root! Do not run me as root!"
		echo -e -n "\033[0m"
		exit 1
		;;
        pi)
		echo -e "\033[31m You ran me as pi user! Do not run me as pi!"
		echo -e -n "\033[0m"
		exit 1
                ;;
        cacti)       
                echo -e "\033[32m Grabbing Cacti db and data and packaging..."
                echo -e -n "\033[0m"
                cactiver=$( cat /var/www/html/cacti/include/cacti_version )
                mkdir cacti_$cactiver
                mysqldump --user=cacti --password=cacti -l --add-drop-table cacti |gzip > ~/cacti_$cactiver/mysql.cacti_$(date +\%Y\%m\%d).sql.gz
                cp -R /var/www/html/cacti/rra ~/cacti_$cactiver/rra
                tar -pczf ~/backup_cacti-$cactiver.tar.gz -C ~/ cacti_$cactiver
		rm -rf cacti_$cactiver
                ;;
        *)
		echo -e "\033[31m Uh-oh. You are not logged in as the cacti user. Exiting..."
		echo -e -n "\033[0m"
		exit 1
                ;;
esac


