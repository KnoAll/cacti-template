#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/master/bootstrap.sh)

if [[ `whoami` == "root" ]]; then
    echo -e  "\033[31m You ran me as root! Do not run me as root!"
    exit 1
    elif [[ `whoami` == "cacti" ]]; then
    echo ""
    else
    echo -e "\033[31m Uh-oh. You are not logged in as the cacti user. Exiting..."
fi

if [ -f ~/cacti-upgrade.sh ]
then
	echo ""
else
	echo -e "\033[32m Downloading cacti-upgrade.sh..."
  wget https://raw.githubusercontent.com/KnoAll/cacti-template/master/cacti-upgrade.sh
  chmod +x cacti-upgrade.sh
fi

./cacti-upgrade.sh
