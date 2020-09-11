#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/upgrade-php.sh)

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

if which yum >/dev/null; then
	pkg_mgr=yum
	os_dist=centos
elif which apt >/dev/null; then
  printerror "Sorry, Raspbian not supported for PHP upgrade yet, cannot proceed..."
  exit 1
	pkg_mgr=apt
	os_dist=raspbian
else
  printerror "You seem to be on something other than CentOS, cannot proceed..."
  exit 1
fi

#installed php version
php_ver=PHP v$( php -r 'echo PHP_VERSION;' )
#set upgrade version

php_version=php73
php_description="v7.3.x"

upgradeAsk () {
	#check version of PHP installed
	php -r 'exit((int)version_compare(PHP_VERSION, "7.3.0", "<"));'
	if [ $? -ne 0 ];then
		printinfo
		read -p "Do you want to upgrade your PHP install to $php_description? y/N: " upAsk
		case "$upAsk" in
		y | Y | yes | YES| Yes ) printinfo "Ok, let's go!"
		upgradePHP
		;;
		* ) 
			printwarn "OK, maybe next time..."
			exit 1
		;;
		esac
	else
		printinfo "Installed PHP $php_ver >= current stalble $php_description."
		exit 0
	fi
}

upgradePHP() {
	printinfo "Setting up repo"
	sudo yum install -y -q http://rpms.remirepo.net/enterprise/remi-release-7.rpm
	sudo yum install -y -q yum-utils
	printinfo "Enabling new $php_description"
	sudo yum-config-manager --enable remi-$php_version
	sudo yum -y -q update
}
upgradeAsk

exit 0
