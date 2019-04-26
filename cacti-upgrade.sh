#!/bin/bash

case $(whoami) in
	root)
		echo -e "\033[31m You ran me as root! Do not run me as root!"
		echo -e -n "\033[0m"
		exit 1
	;;
	cacti)
	;;
	*)
		echo -e "\033[31m Uh-oh. You are not logged in as the cacti user. Exiting..."
		echo -e -n "\033[0m"
		exit
	;;
esac

case $1 in
	dev)
		echo -e "\033[31m Switching to DEV script..."
		echo -e -n "\033[0m"
		bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/upgrade-cacti.sh) $1 $2
	;;
	--fix-permissions)
		echo -e "\033[31m Fixing Cacti file permissions..."
		echo -e -n "\033[0m"
		bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/master/update-permissions.sh)
	;;
	*)
		    bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/master/upgrade-cacti.sh) $1 $2
	;;
esac
