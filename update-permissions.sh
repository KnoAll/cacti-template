#!/bin/bash
# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/update-permissions.sh) dev debug
green=$(tput setaf 2)
red=$(tput setaf 1)
tan=$(tput setaf 3)
reset=$(tput sgr0)
errorcount=0

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
			trap 'echo cmd: "$BASH_COMMAND" on line $LINENO exited with code: $?' DEBUG
		;;
		dev|-dev|--dev)
			branch="dev"
		;;
	    esac
	done
fi

if which yum >/dev/null; then
	pkg_mgr=yum
elif which apt >/dev/null; then
	pkg_mgr=apt
elif which dnf >/dev/null; then
	pkg_mgr=dnf
	printinfo pkgmgr=dnf
else
		printerror "You seem to be on something other than CentOS or Raspian, cannot proceed..."
		exit 1
fi

printinfo "Fixing file permissions..."
#if [[ $pkg_mgr == "yum" ]]; then
#	perm_grp=apache
#else
#	perm_grp=www-data
#fi
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

groups | grep -q '\$permgrp\b'
if [ $? -ne 0 ];then
sudo usermod -a -G $perm_grp cacti
fi
sudo chgrp -R $perm_grp /var/www/html/cacti/log
sudo chgrp -R $perm_grp /var/www/html/cacti/resource
sudo chgrp -R $perm_grp /var/www/html/cacti/cache
sudo chgrp -R $perm_grp /var/www/html/cacti/scripts
sudo chgrp -R $perm_grp /var/www/html/cacti/rra
sudo chgrp -R $perm_grp /var/www/html/cacti/include/vendor/csrf
sudo chown -R cacti /var/www/html
sudo find /var/www/html -type d -exec chmod g+rwx {} +
sudo find /var/www/html -type f -exec chmod g+rw {} +
sudo find /var/www/html -type d -exec chmod u+rwx {} +
sudo find /var/www/html -type f -exec chmod u+rw {} +
sudo find /var/www/html -type d -exec chmod g+s {} +
touch /var/www/html/cacti/log/cacti.log
chmod g+w /var/www/html/cacti/log/cacti.log

printinfo
sudo systemctl restart httpd
exit
