#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/master/upgrade-plugins.sh)

cd /var/www/html/cacti/plugins

for dir in ./*/
do
  cd ${dir}
  git status >/dev/null 2>&1
  # check if exit status of above was 0, indicating we're in a git repo
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
