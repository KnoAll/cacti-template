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

cactiver=$( cat /var/www/html/cacti/include/cacti_version )
upgrade_version=1.1.6
prod_version=1.1.38

function version_ge() { test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" == "$1"; }

if version_ge $cactiver $upgrade_version; then
        if version_ge $cactiver $prod_version; then
                echo -e "\033[32m Cacti v$cactiver is up to date or newer than production v$prod_version, nothing to do, exiting!"
		echo -e -n "\033[0m"
                exit 0
        else
		bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/master/upgrade.sh)
                exit
        fi
else
                echo -e "\033[31m Cacti v$cactiver is less than minimum upgrade version v$upgrade_version cannot install, exiting..."
		echo -e -n "\033[0m"
                exit
fi
