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

function version_gt() { test "$(echo "$@" | tr " " "\n" | sort -V | head -n 1)" != "$1"; }
function version_lt() { test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" != "$1"; }
function version_ge() { test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" == "$1"; }

if version_gt $cactiver $upgrade_version; then
        if version_ge $cactiver $prod_version; then
                echo "Installed Cacti v$cactiver is up to date or newer than production v$prod_version, nothing to do, exiting!"
                exit 0
        else
		bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/master/upgrade.sh)
        fi
else
        if version_lt $cactiver $upgrade_version; then
                echo "Cacti v$cactiver is less than upgrade version v$upgrade_version cannot install, exiting..."
                exit 1
        else
              if version_ge $cactiver $upgrade_version; then
		bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/master/upgrade.sh)
                fi
        fi
fi
