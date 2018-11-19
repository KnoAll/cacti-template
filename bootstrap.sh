#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/master/update-git.sh)

if [[ `whoami` == "root" ]]; then
    echo "You ran me as root! Do not run me as root!"
    exit 1
fi

if [ -f ~/cacti-upgrade.sh ]
then
	echo ""
else
	echo "Downloading cacti-upgrade.sh"
  wget https://raw.githubusercontent.com/KnoAll/cacti-template/master/cacti-upgrade.sh
  chmod +x cacti-upgrade.sh
fi

./cacti-upgrade.sh
