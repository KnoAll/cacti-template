#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/update-permissions-smokeping.sh) dev
green=$(tput setaf 2)
red=$(tput setaf 1)
tan=$(tput setaf 3)
reset=$(tput sgr0)
errorcount=0
branch=master

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

#ingest options
if [[ "$#" > 0 ]]; then
	for var in "$@"; do
	    case $var in
		debug|-debug|--debug)
			trap 'printwarn "DEBUG: $BASH_COMMAND on line $LINENO exited with code: $?"' DEBUG
		;;
		dev|-dev|--dev)
			branch="dev"
			printwarn "Now on DEV branch..."
		;;
	    esac
	done
fi

if which dnf >/dev/null; then
	pkg_mgr=dnf
	printinfo pkgmgr=dnf
elif which yum >/dev/null; then
	pkg_mgr=yum
elif which apt >/dev/null; then
	pkg_mgr=apt
else
	printerror "You seem to be on something other than CentOS or Raspian, cannot proceed..."
	exit 1
fi

printinfo "Fixing SmokePing permissions..."
case $pkg_mgr in
	yum)
		perm_grp=apache
	;;
	apt)
		perm_grp=www-data
	;;
	dnf)
		perm_grp=apache
	;;
esac
groups | grep -q '\$perm_grp\b'
if [ $? -ne 0 ];then
	sudo usermod -a -G $perm_grp cacti
fi

sudo chown -R cacti /opt
sudo chgrp -R $perm_grp /opt
sudo find /opt -type d -exec chmod g+rwx {} +
sudo find /opt -type f -exec chmod g+rw {} +
sudo find /opt -type d -exec chmod u+rwx {} +
sudo find /opt -type f -exec chmod u+rw {} +
sudo find /opt -type d -exec chmod g+s {} +

exit
