#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/upgrade-php.sh)

#ingest options
while :; do
    case $1 in
        debug|-debug|--debug)
                trap 'echo cmd: "$BASH_COMMAND" on line $LINENO exited with code: $?' DEBUG
        ;;
        dev|-dev|--dev)
                branch="dev"
        ;;
	php|-php|--php)
	branch="php"
        ;;
        *) break
    esac
    shift
done

# error handling
#set -eE
exit_trap() {
		local lc="$BASH_COMMAND" rc=$?
		if [ $rc -ne 0 ]; then
		printerror "Command [$lc] on $LINENO exited with code [$rc]"
		fi
}
trap exit_trap EXIT


green=$(tput setaf 2)
red=$(tput setaf 1)
tan=$(tput setaf 3)
reset=$(tput sgr0)

printinfo() {
	printf "${tan}::: ${green}%s${reset}\n" "$@"
}
printwarn() {
	printf "${tan}*** WARNING: %s${reset}\n" "$@"
}
printerror() {
	printf "${red}!!! ERROR: %s${reset}\n" "$@"
}

if [[ $1 == "dev" || $1 == "--switch-dev" ]]; then
	param1=$1
	param2=$2
	branch=dev
	printwarn "Now on DEV PHP branch."
else
	printinfo
	branch=master
fi

#installed cacti version
cactiver=$( cat /var/www/html/cacti/include/cacti_version )
#minimum version for php
upgrade_version=1.2.18
#installed php version
php_ver=v$( php -r 'echo PHP_VERSION;' )
smphp_ver=$(echo $php_ver | cut -c-4)
#set upgrade version
php_version=php74
php_description="v7.4.x"

printinfo "Checking for PHP upgrade..."
printinfo
if [[ `whoami` == "root" ]]; then
    printerror "You ran me as root! Do not run me as root!"
    exit 1
elif grep -q "Raspbian GNU/Linux 9" /etc/os-release; then
  printerror "Sorry, Raspbian not supported for PHP upgrade yet, cannot proceed..."
  printinfo
  exit 1
	if [[ `whoami` != "pi" ]]; then
		printerror "Uh-oh. You are not logged in as the default pi user. Exiting..."
		exit 1
	else
		os_dist=raspbian
		os_name=Raspbian
		webserver=apache2
		verphp="$(php -v | grep -Po '(?<=PHP )([0-7.]+)' | cut -c-3)"
	fi
elif grep -q "Raspbian GNU/Linux 10" /etc/os-release; then
  printerror "Sorry, Raspbian not supported for PHP upgrade yet, cannot proceed..."
  printinfo
  exit 1
	if [[ `whoami` != "pi" ]]; then
		printerror "Uh-oh. You are not logged in as the default pi user. Exiting..."
		printinfo
		exit 1
	else
		os_dist=raspbian
		os_name=Raspbian
		webserver=apache2
		verphp="$(php -v | grep -Po '(?<=PHP )([0-7.]+)' | cut -c-3)"
	fi
elif grep -q "CentOS Linux 7" /etc/os-release; then
	if [[ `whoami` != "cacti" ]]; then
		printerror "Uh-oh. You are not logged in as the default cacti user. Exiting..."
		printinfo
		exit 1
	else
		os_dist=centos
		os_name=CentOS7
		webserver=httpd
		pkg_mgr=yum
		os_dist=centos
		remi=remi-release-7.rpm
	fi
elif grep -q "CentOS Linux 8" /etc/os-release; then
  #printerror "Sorry, CentOS8 not supported for PHP upgrade yet, cannot proceed..."
  printinfo
 # exit 1
	if [[ `whoami` != "cacti" ]]; then
		printerror "Uh-oh. You are not logged in as the default cacti user. Exiting..."
		printinfo
		exit 1
	else
		os_dist=centos
		os_name=CentOS8
		webserver=httpd
		pkg_mgr=yum
		os_dist=centos
		remi=remi-release-8.rpm
		php_version=remi-7.4
	fi	
else
	printerror "We don't appear to be on a supported OS. Exiting..."
	printinfo
	exit 1
fi

function version_ge() { test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" == "$1"; }

if version_ge $cactiver $upgrade_version; then
	#php version meets minimum required
	printinfo
else
	printerror "Cacti v$cactiver is less than required upgrade version v$upgrade_version cannot upgrade php, exiting..."
	exit
fi

upgradeAsk () {
	#check version of PHP installed
	php -r 'exit((int)version_compare(PHP_VERSION, "7.4.0", "<"));'
	if [ $? -ne 0 ];then
		printinfo
		read -p "Do you want to upgrade your PHP install to $php_description? y/N: " upAsk
		case "$upAsk" in
		y | Y | yes | YES| Yes ) printinfo "Ok, let's go!"
			if [[ $param1 == "dev" ]]; then
				printwarn $param1
			else
				counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=upgrade-php_$smphp_ver&write=0 )
				counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=upgrade-php&write=0 )
			fi
			upgradePHP
		;;
		* ) 
			printwarn "OK, please consider upgrading, old versions of PHP are not updated and may contain known security and stability issues."
			if [[ $param1 == "dev" ]]; then
				printwarn $param1
			else
				counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=decline-upgrade-php&write=0 )
			fi
			exit 1
		;;
		esac
	else
		printinfo "Installed PHP $php_ver >= current stable $php_description."
		exit 0
	fi
}

upgradePHP() {
		printinfo "Setting up repo"
		sudo yum install -y -q http://rpms.remirepo.net/enterprise/$remi
		sudo yum install -y -q yum-utils
		printinfo "Enabling new $php_description"
		case "$os_name" in
			CentOS8 )
				sudo dnf -y -q module reset php
				sudo dnf module -y -q enable php:$php_version
				sudo dnf -y -q install php
				if [ $? -ne 0 ];then
					printwarn "ERROR upgrading PHP version."
				else
					php_ver=v$( php -r 'echo PHP_VERSION;' )
					printinfo "PHP upgraded to $php_ver"
				fi
			;;
			* )
				sudo yum-config-manager --enable remi-$php_version
				sudo yum -y -q update
				if [ $? -ne 0 ];then
					printwarn "ERROR upgrading PHP version."
				else
					php_ver=v$( php -r 'echo PHP_VERSION;' )
					printinfo "PHP upgraded to $php_ver"
				fi
			;;
		esac


}

upgradeAsk

printinfo

exit 0
