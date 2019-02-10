#!/bin/bash

if which yum >/dev/null; then
	pkg_mgr=yum
elif which apt >/dev/null; then
	pkg_mgr=apt
else
		echo -e "\033[31m You seem to be on something other than CentOS or Raspian, cannot proceed..."
		echo -e -n "\033[0m"
		exit 1
fi

echo -e "\033[32m Fixing file permissions..."
echo -e -n "\033[0m"
if [[ $pkg_mgr == "yum" ]]; then
	perm_grp=apache
else
	perm_grp=www-data
fi
groups | grep -q '\$permgrp\b'
if [ $? -ne 0 ];then
sudo usermod -a -G $perm_grp cacti
fi
sudo chgrp -R $perm_grp /var/www/html/cacti/log
sudo chgrp -R $perm_grp /var/www/html/cacti/resource
sudo chgrp -R $perm_grp /var/www/html/cacti/cache
sudo chgrp -R $perm_grp /var/www/html/cacti/scripts
sudo chown -R cacti /var/www/html
sudo find /var/www/html -type d -exec chmod g+rwx {} +
sudo find /var/www/html -type f -exec chmod g+rw {} +
sudo find /var/www/html -type d -exec chmod u+rwx {} +
sudo find /var/www/html -type f -exec chmod u+rw {} +
sudo find /var/www/html -type d -exec chmod g+s {} +
touch /var/www/html/cacti/log/cacti.log
chmod g+w /var/www/html/cacti/log/cacti.log

exit
