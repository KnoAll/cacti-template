#!/bin/bash

#  bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/cacti-upgrade.sh)
scriptver=v1.2.24
green=$(tput setaf 2)
red=$(tput setaf 1)
tan=$(tput setaf 3)
reset=$(tput sgr0)

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
	cacti)
	;;
	*)
		printerror "Uh-oh. You are not logged in as the cacti user. Exiting..."
		exit 1
	;;
esac

welcomeMessage() {
  echo -n "${tan}"
  cat << "EOF"
  ______                 _ 
 / _____)           _   (_)
| /      ____  ____| |_  _ 
| |     / _  |/ ___|  _)| |
| \____( ( | ( (___| |__| |
 \______\_||_|\____)\___|_|

EOF
  echo -n "${reset}"
  echo "Welcome to Kevin's Cacti script!"
  echo
}

branch=master

function upgradeScript () {
	printinfo "Upgrading cacti-upgrade.sh"
	rm cacti-upgrade.sh
	wget -q https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/cacti-upgrade.sh
	chmod +x cacti-upgrade.sh
}

welcomeLooper() {
case $1 in
	dev)
		printwarn "Switching to DEV script"
		bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/upgrade-cacti.sh) $1 $2
	;;
	--fix-permissions)
		welcomeMessage
		counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=update-permissions&write=0 )
		bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/update-permissions.sh) $1 $2
	;;
	--backup-data)
		welcomeMessage
		counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=backup-data&write=0 )
		bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/backup-cacti.sh) $1 $2
	;;
	--restore-data)
		welcomeMessage
		bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/restore-cacti.sh) $1 $2
	;;
	--upgrade-mysql)
		welcomeMessage
		bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/upgrade-mysql.sh) $1 $2
	;;
	--upgrade-php)
		welcomeMessage
		bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/upgrade-php.sh) $1 $2
	;;
	--upgrade-script)
		upgradeScript
	;;
	--upgrade-smokeping)
		welcomeMessage
		bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/upgrade-smokeping.sh) $1 $2 $3
	;;	
	--upgrade-spine)
		welcomeMessage
		bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/upgrade-spine.sh) $2 $3
	;;
	--switch-dev)
		printwarn "Switching to DEV branch"
		branch=dev
		welcomeLooper $2
	;;
	--help | --h | --H | -h | help | -? | --? )
		printinfo "Switches available in this script:"
		printinfo "--backup-data	Backup Cacti data (only) and compress to home directory"
		printinfo "--pick-location	Used with --backup-data or --restore-data, allows selection of alternate storate location"
		printinfo "--fix-permissions	Fix file permissions if graphs not created properly"
		printinfo "--restore-data	Restore Cacti from previous backup"
		printinfo "--upgrade-mysql	DEV ONLY, NOT STABLE - Upgrade MYSQL/MariaDB on the server"
		printinfo "--upgrade-php	Upgrade PHP on the server"
		printinfo "--upgrade-script	Upgrade this script"
		printinfo "--upgrade-smokeping	Upgrade SmokePing version"		
		printinfo "--upgrade-spine	Upgrade Spine on the server. Use with --pick-version to downgrade to a specific version"
		printinfo "--pick-version	Must be used with --upgrade-spine. Usage --upgrade-spine --pick-version 1.x.x"
	;;
	*)
		welcomeMessage
		bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/upgrade-cacti.sh) $1 $2
	;;
esac
}

welcomeLooper $1 $2 $3
