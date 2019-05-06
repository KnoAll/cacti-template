#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/upgrade-plugins.sh)

case $1 in
	dev)
		branch=dev
	;;
	develop)
		branch=develop
	;;
	*)
		branch=master
		counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=upgrade-plugins&write=0 )
	;;
esac


echo ""
echo ""
cd /var/www/html/cacti/plugins

for dir in ./*/
do
  cd ${dir}
  git status >/dev/null 2>&1
  # check if exit status of above was 0, indicating we're in a git repo
#  [ $(echo $?) -eq 0 ] && echo "Updating ${dir%*/}..." && git checkout master && git pull
  [ $(echo $?) -eq 0 ] && echo "Updating ${dir%*/}..." && git pull
  cd ..
done

function update-syslog-config () {
echo -e "\033[32m Updating syslog plugin config..."
echo -e -n "\033[0m"
cd /var/www/html/
cp cacti/plugins/syslog/config.php.dist cacti/plugins/syslog/config.php
sed -i 's/cactiuser/cacti/g' cacti/plugins/syslog/config.php
}
