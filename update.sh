#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/master/update.sh)
echo "Welcome!"

if [[ `whoami` == "root" ]]; then
    echo "You ran me as root! Do not run me as root!"
    exit 1
fi

function upgrade-git () {
echo "Upgrading Git"
rpm -U http://opensource.wandisco.com/centos/7/git/x86_64/wandisco-git-release-7-2.noarch.rpm \
    && yum install -y git	
}

function backup-db () {
echo "Backing up DB..."
mysqldump --user=cacti --password=cacti -l --add-drop-table cacti |gzip > ~/mysql.cacti_$(date +\%Y\%m\%d).sql.gz
}

function upgrade-cacti () {
echo "Begining Cacti upgrade..."
cd /var/www/html/
git -C cacti/ pull --no-edit
}

function upgrade-plugins () {
echo "Upgrading plugins..."
cd /var/www/html/
git -C cacti/plugins/mactrack/ pull --no-edit
git -C cacti/plugins/monitor/ pull --no-edit
git -C cacti/plugins/webseer/ pull --no-edit
git -C cacti/plugins/gexport/ pull --no-edit
git -C cacti/plugins/syslog/ pull --no-edit
git -C cacti/plugins/thold/ pull --no-edit
git -C cacti/plugins/routerconfigs/ pull --no-edit
git -C cacti/plugins/flowview/ pull --no-edit
git -C cacti/plugins/maint/ pull --no-edit
git -C cacti/plugins/audit/ pull --no-edit
git -C cacti/plugins/cycle/ pull --no-edit
git -C cacti/plugins/weathermap/ pull --no-edit
echo "Installing Weathermap plugin"
cd cacti/plugins/weathermap/
bower install --allow-root
composer update --no-dev
}

function update-config () {
echo "Updating cacti config..."
cd /var/www/html/
cp cacti/include/config.php.dist cacti/include/config.php
echo "$(awk '{sub(/cactiuser/,"cacti")}1' cacti/include/config.php)" > cacti/include/config.php
}

function upgrade-spine () {
echo "Upgrading spine..."
}

backup-db
upgrade-cacti
upgrade-plugins
