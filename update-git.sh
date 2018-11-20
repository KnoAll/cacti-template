#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/master/update.sh)

if [[ `whoami` == "root" ]]; then
    echo "You ran me as root! Do not run me as root!"
    exit 1
fi

if [ -f ~/.cacti-template ]
then
	echo "Found preexisting Cacti-template v1.2.x Install, proceeding to upgrade..."
	echo ""
else
	echo "Cacti-template based install not present, sorry cannot upgrade. Exiting..."
    sleep 5
    exit 1
fi

# get the Cacti version
cactiver=$( cat /var/www/html/cacti/cacti_version )

function version_gt() { 
test "$(printf '%s\n' "$@" | sort -V | head -n 1)" != "$1";
}

upgrade_version=1.1.20
if version_gt $cactiver $upgrade_version; then
     echo "Installed cacti version $cactiver is greater than required $upgrade_version! Proceeding to upgrade..."
else
	echo "Current version is not compatible with upgrade version, exiting..."
fi


echo "Welcome to Kevin's Cacti Template upgrade script!"
echo ""

function upgrade-git () {
echo "Upgrading Git"
rpm -U http://opensource.wandisco.com/centos/7/git/x86_64/wandisco-git-release-7-2.noarch.rpm \
    && yum install -y git	
echo ""
}

function backup-db () {
echo "Backing up DB..."
mysqldump --user=cacti --password=cacti -l --add-drop-table cacti |gzip > /var/www/html/cacti/mysql.cacti-v$cactiver_$(date +\%Y\%m\%d).sql.gz
echo ""
}

function upgrade-cacti () {
echo "Begining Cacti upgrade..."
cd /var/www/html/
git -C cacti/ pull --no-edit
echo ""
}

function upgrade-plugins () {
echo "Upgrading plugins..."
cd /var/www/html/
echo "Upgrading Mactrack..."
git -C cacti/plugins/mactrack/ pull --no-edit
echo ""
echo "Upgrading Monitor..."
git -C cacti/plugins/monitor/ pull --no-edit
echo ""
echo "Upgrading Webseer..."
git -C cacti/plugins/webseer/ pull --no-edit
echo ""
echo "Upgrading GExport..."
git -C cacti/plugins/gexport/ pull --no-edit
echo ""
echo "Upgrading Syslog..."
git -C cacti/plugins/syslog/ pull --no-edit
echo ""
echo "Upgrading THold..."
git -C cacti/plugins/thold/ pull --no-edit
echo ""
echo "Upgrading Routerconfigs..."
git -C cacti/plugins/routerconfigs/ pull --no-edit
echo ""
echo "Upgrading FlowView..."
git -C cacti/plugins/flowview/ pull --no-edit
echo ""
echo "Upgrading Maint..."
git -C cacti/plugins/maint/ pull --no-edit
echo ""
echo "Upgrading Audit..."
git -C cacti/plugins/audit/ pull --no-edit
echo ""
echo "Upgrading Cycle..."
git -C cacti/plugins/cycle/ pull --no-edit
echo ""
echo "Upgrading Weathermap..."
git -C cacti/plugins/weathermap/ pull --no-edit
echo ""
echo "Installing Weathermap..."
cd cacti/plugins/weathermap/
bower install --allow-root
composer update --no-dev
echo ""
}

function update-config () {
echo "Updating cacti config..."
cd /var/www/html/
cp cacti/include/config.php.dist cacti/include/config.php
echo "$(awk '{sub(/cactiuser/,"cacti")}1' cacti/include/config.php)" > cacti/include/config.php
echo ""
}

function update-syslog-config () {
echo "Updating syslog plugin config..."
cd /var/www/html/
cp cacti/plugins/syslog/config.php.dist cacti/plugins/syslog/config.php
echo "$(awk '{sub(/cactiuser/,"cacti")}1' cacti/plugins/syslog/config.php)" > cacti/plugins/syslog/config.php
echo ""
}


function upgrade-spine () {
echo "Upgrading spine..."
echo ""
}

backup-db
upgrade-cacti
upgrade-plugins
