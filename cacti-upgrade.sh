#!/bin/bash

if [[ `whoami` == "root" ]]; then
    echo "You ran me as root! Do not run me as root!"
    exit 1
    elif [[ `whoami` == "cacti" ]]; then
    echo ""
    else
    echo "Uh-oh. You are not logged in as the cacti user. Exiting..."
fi

# get the Cacti version
cactiver=$( cat /var/www/html/cacti/include/cacti_version )
upgrade_version=1.1.0
prod_version=1.1.38

function version_gt() { 
test "$(printf '%s\n' "$@" | sort -V | head -n 1)" != "$1";
}

if version_gt $cactiver $upgrade_version; then
	if version_gt $cactiver $prod_version; then
		echo "Current installed Cacti v$cactiver is current! No need to upgrade, exiting..."
		exit 0
	else
		bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/master/upgrade.sh)
	fi
else
	echo "Current cacti install v$cactiver is not compatible with upgrade version v$upgrade_version, exiting..."
	exit 1
fi
