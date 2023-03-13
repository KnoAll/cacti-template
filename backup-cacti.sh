#!/bin/bash
#bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/backup-cacti.sh)

# error handling
#set -eE
exit_trap() {
		local lc="$BASH_COMMAND" rc=$?
		if [ $rc -ne 0 ]; then
		printerror "Command [$lc] on line $LINENO exited with code [$rc]"
		# cleanup temp files
		rm -rf cacti_$cactiver
		fi
}
#trap exit_trap EXIT

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

#ingest options
while :; do
    case $1 in
        debug|-debug|--debug)
                trap 'echo cmd: "$BASH_COMMAND" on line $LINENO exited with code: $?' DEBUG
        ;;
        dev|-dev|--dev)
                branch="dev"
        ;;
        *) break
    esac
    shift
done

backupData() {
                printinfo "Grabbing Cacti db and data and packaging..."
                cactiver=$( cat /var/www/html/cacti/include/cacti_version )
                mkdir cacti_$cactiver
		set -o pipefail
                #mysqldump --user=cacti --password=cacti -l --add-drop-table cacti > ~/cacti_$cactiver/mysql.cacti_$(date +\%Y\%m\%d).sql
		mysqldump --user=cacti --password=cacti -l --add-drop-table cacti |gzip > ~/cacti_$cactiver/mysql.cacti_$(date +\%Y\%m\%d).sql.gz
		if [[ $? -ne 0 ]];then
			printerror "trying to backup cactimain"
			mysqldump --user=cacti --password=cacti -l --add-drop-table cactimain > ~/cacti_$cactiver/mysql.cacti_$(date +\%Y\%m\%d).sql
			if [[ $? -ne 0 ]];then
				printerror "Error backing up alternate Cacti db cactimain, DATABASE NOT BACKED UP! You should back up manually."
			fi
		else
		gzip ~/cacti_$cactiver/mysql.cacti_$(date +\%Y\%m\%d).sql
			if [[ $? -ne 0 ]];then
				printerror "Cacti database NOT BACKED UP!"
			else
				printinfo "Cacti DB backed up."
			fi
		fi
		set +o pipefail
                cp -R /var/www/html/cacti/rra ~/cacti_$cactiver/rra
		rsync -raq /var/www/html/cacti/resource ~/cacti_$cactiver/
		rsync -raq /var/www/html/cacti/scripts ~/cacti_$cactiver/
		rsync -raq /var/www/html/cacti/include/themes ~/cacti_$cactiver/
		cp /var/www/html/cacti/include/config.php ~/cacti_$cactiver
		cp /usr/local/spine/etc/spine.conf ~/cacti_$cactiver
		echo $cactiver > cacti_$cactiver/.cacti-backup
                tar -pczf ~/backup_cacti-$cactiver_$(date +\%Y\%m\%d).tar.gz -C ~/ cacti_$cactiver
		rm -rf cacti_$cactiver
}

backupData
exit 0
