#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/master/upgrade.sh)

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

function version_ge() { test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" == "$1"; }

if version_ge $cactiver $upgrade_version; then
        if version_ge $cactiver $prod_version; then
                echo "Cacti v$cactiver is up to date or with production v$prod_version, nothing to do, exiting!"
                exit 0
        else
		echo "Installed cacti v$cactiver is greater than required v$upgrade_version! Proceeding to upgrade..."
        fi
else
                echo "Cacti v$cactiver is less than upgrade version v$upgrade_version cannot install, exiting..."
                exit
fi

echo "Welcome to Kevin's Cacti Template upgrade script!"
sudo echo ""

function backup-db () {
echo "Backing up DB..."
mysqldump --user=cacti --password=cacti -l --add-drop-table cacti |gzip > /var/www/html/cacti/mysql.cacti_$(date +\%Y\%m\%d).sql.gz
echo ""
}

function upgrade-cacti () {
echo "Begining Cacti upgrade..."
cd /var/www/html/
mv cacti/ cacti_$cactiver/
wget https://www.cacti.net/downloads/cacti-$prod_version.tar.gz
tar -xzf cacti-1.*.tar.gz
rm cacti-1.*.tar.gz
mv cacti-$prod_version cacti
cp -a cacti_$cactiver/rra/* cacti/rra/
cp -a cacti_$cactiver/scripts/* cacti/scripts/
cp -a cacti_$cactiver/resource/* cacti/resource/
cp -a cacti_$cactiver/plugins/* cacti/plugins/
update-config
update-permissions
echo ""
}

function upgrade-plugins () {
echo "Upgrading plugins..."
cd /var/www/html/
echo "Upgrading Mactrack..."
git clone https://github.com/Cacti/plugin_mactrack.git cacti/plugins/mactrack
echo ""
echo "Upgrading Monitor..."
git clone https://github.com/Cacti/plugin_monitor.git cacti/plugins/monitor
echo ""
echo "Upgrading Webseer..."
git clone https://github.com/Cacti/plugin_webseer.git cacti/plugins/webseer
echo ""
echo "Upgrading GExport..."
git clone https://github.com/Cacti/plugin_gexport.git cacti/plugins/gexport
echo ""
echo "Upgrading Syslog..."
git clone https://github.com/Cacti/plugin_syslog.git cacti/plugins/syslog
echo "Updating syslog config..."
update-syslog-config
echo ""
echo "Upgrading THold..."
git clone https://github.com/Cacti/plugin_thold.git cacti/plugins/thold
echo ""
echo "Upgrading Routerconfigs..."
git clone https://github.com/Cacti/plugin_routerconfigs.git cacti/plugins/routerconfigs
echo ""
echo "Upgrading FlowView..."
git clone https://github.com/Cacti/plugin_flowview.git cacti/plugins/flowview
echo ""
echo "Upgrading Maint..."
git clone https://github.com/Cacti/plugin_maint.git cacti/plugins/maint
echo ""
echo "Upgrading Audit..."
git clone https://github.com/Cacti/plugin_audit.git cacti/plugins/audit
echo ""
echo "Upgrading Cycle..."
git clone https://github.com/Cacti/plugin_cycle.git cacti/plugins/cycle
echo ""
#echo "Upgrading Weathermap..."
#git clone https://github.com/howardjones/network-weathermap.git --single-branch cacti/plugins/weathermap
#echo ""
#echo "Installing Weathermap..."
#cd cacti/plugins/weathermap/
#bower install --allow-root
#composer update --no-dev
#echo ""
}

function update-config () {
echo "Updating cacti config..."
cd /var/www/html/
#cp cacti/include/config.php.dist cacti/include/config.php
echo "$(awk '{sub(/cactiuser/,"cacti")}1' cacti/include/config.php)" > cacti/include/config.php
}

function update-syslog-config () {
echo "Updating syslog plugin config..."
cd /var/www/html/
cp cacti/plugins/syslog/config.php.dist cacti/plugins/syslog/config.php
echo "$(awk '{sub(/cactiuser/,"cacti")}1' cacti/plugins/syslog/config.php)" > cacti/plugins/syslog/config.php
}

function update-permissions () {
echo "Fixing file permissions..."
sudo chgrp -R apache /var/www/html
sudo chown -R cacti /var/www/html/
sudo find /var/www/html -type d -exec chmod g+rx {} +
sudo find /var/www/html -type f -exec chmod g+r {} +
sudo find /var/www/html -type d -exec chmod u+rwx {} +
sudo find /var/www/html -type f -exec chmod u+rw {} +
sudo find /var/www/html -type d -exec chmod g+s {} +
touch /var/www/html/cacti/log/cacti.log
chmod g+w cacti/log/cacti.log
}

function upgrade-spine () {
echo "Upgrading spine..."
sudo yum install gcc glibc glibc-common gd gd-devel -y
cd
wget https://www.cacti.net/downloads/spine/cacti-spine-$prod_version.tar.gz
tar -xzf cacti-spine-*.tar.gz
rm cacti-spine-*.tar.gz
cd cacti-spine-*
./configure
make
sudo make install
cd
rm -rf cacti-spine-*
cd /usr/local/spine/bin
sudo chown root:root spine
sudo chmod +s spine
echo ""
}

#upgrade-git
backup-db
upgrade-cacti
upgrade-spine
#upgrade-plugins
echo "Cacti upgraded to v$prod_version. Proceed to the web interface to complete upgrade..."
exit 0