#!/bin/bash

if [[ `whoami` == "root" ]]; then
    echo -e "\033[31m You ran me as root! Do not run me as root!"
    echo -e -n "\033[0m"
    exit 1
    elif [[ `whoami` == "cacti" ]]; then
    echo ""
    else
    echo -e "\033[31m Uh-oh. You are not logged in as the cacti user. Exiting..."
    echo -e -n "\033[0m"
    exit
fi
if [[ $1 == "dev" ]]; then
	echo -e "\033[31m Switching to DEV script..."
	echo -e -n "\033[0m"
    bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/upgrade-cacti.sh) $1 $2
else
    bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/master/upgrade-cacti.sh) $1 $2
fi
