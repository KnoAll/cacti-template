#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/master/upgrade.sh)

if [[ `whoami` == "root" ]]; then
    echo -e "\033[31m You ran me as root! Do not run me as root!"
    echo -e -n "\033[0m"
    exit 1
    elif [[ `whoami` == "cacti" ]]; then
    	echo ""
    else
    echo -e "\033[31m Uh-oh. You are not logged in as the cacti user. Exiting..."
    echo -e -n "\033[0m"
    exit 1
fi

# get the Cacti version
upgrade_version=1.1.6
prod_version=1.1.38
dev_version=1.2.0-beta4
symlink_cactidir=1.1.28
cactiver=$( cat /var/www/html/cacti/include/cacti_version )
if [ $? -ne 0 ];then
	echo -e "\033[31m Cacti is either not installed or not compatible with minimum required v$upgrade_version cannot proceed, exiting..."
	echo -e -n "\033[0m"
	exit 1
fi

function version_ge() { test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" == "$1"; }
function version_lt() { test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" != "$1"; }

if version_ge $cactiver $upgrade_version; then
        if version_ge $cactiver $prod_version; then
                echo -e "\033[32m Cacti v$cactiver is up to date with production v$prod_version, nothing to do, exiting!"
		echo -e -n "\033[0m"
                exit 0
        else
		echo -e "\033[32m Installed cacti v$cactiver is greater than required v$upgrade_version! Upgrading to v$prod_version..."
		echo -e -n "\033[0m"
        fi
else
	echo -e "\033[31m Cacti v$cactiver is less than upgrade version v$upgrade_version cannot install, exiting..."
	echo -e -n "\033[0m"
	exit 1
fi

echo -e "\033[32m Welcome to Kevin's Cacti Template upgrade script!"
echo -e -n "\033[0m"
sudo echo ""

function backup-db () {
echo -e "\033[32m Backing up DB..."
echo -e -n "\033[0m"
mysqldump --user=cacti --password=cacti -l --add-drop-table cacti |gzip > /var/www/html/cacti/mysql.cacti_$(date +\%Y\%m\%d).sql.gz
echo ""
}

function check-permissions () {
touch /var/www/html/perm
if [ $? -ne 0 ];then
	echo -e "\033[31m File permissions not sufficient, attempting to repair..."
	echo -e -n "\033[0m"
	update-permissions
else
	rm /var/www/html/perm
	echo ""
fi
}

function check-prerequisites () {
	echo ""
}

function upgrade-cacti () {
echo -e "\033[32m Begining Cacti upgrade..."
echo -e -n "\033[0m"
cd /var/www/html/
wget -q https://github.com/Cacti/cacti/archive/release/$prod_version.tar.gz
if [ $? -ne 0 ];then
                echo -e "\033[31m Cacti download error cannot install, exiting..."
                echo -e -n "\033[0m"
		exit 1
else
tar -xzf $prod_version.tar.gz
	if [ $? -ne 0 ];then
                echo -e "\033[31m Cacti unpack error cannot install, exiting..."
                echo -e -n "\033[0m"
		exit 1
	else
		mv cacti/ cacti_$cactiver/
		rm $prod_version.tar.gz
		mv cacti-release-$prod_version cacti
		cp -a cacti_$cactiver/rra/* cacti/rra/
		cp -a cacti_$cactiver/scripts/* cacti/scripts/
		cp -a cacti_$cactiver/resource/* cacti/resource/
		cp -a cacti_$cactiver/plugins/* cacti/plugins/
		update-config
		update-permissions
		echo ""
	fi
fi
}

function upgrade-plugins () {
echo -e "\033[32m Upgrading plugins..."
echo -e -n "\033[0m"
cd /var/www/html/
echo -e "\033[32m Upgrading Mactrack..."
echo -e -n "\033[0m"
git clone https://github.com/Cacti/plugin_mactrack.git cacti/plugins/mactrack
echo ""
echo -e "\033[32m Upgrading Monitor..."
echo -e -n "\033[0m"
git clone https://github.com/Cacti/plugin_monitor.git cacti/plugins/monitor
echo ""
echo -e "\033[32m Upgrading Webseer..."
echo -e -n "\033[0m"
git clone https://github.com/Cacti/plugin_webseer.git cacti/plugins/webseer
echo ""
echo -e "\033[32m Upgrading GExport..."
echo -e -n "\033[0m"
git clone https://github.com/Cacti/plugin_gexport.git cacti/plugins/gexport
echo ""
echo -e "\033[32m Upgrading Syslog..."
echo -e -n "\033[0m"
git clone https://github.com/Cacti/plugin_syslog.git cacti/plugins/syslog
echo -e "\033[32m Updating syslog config..."
echo -e -n "\033[0m"
update-syslog-config
echo ""
echo -e "\033[32m Upgrading THold..."
echo -e -n "\033[0m"
git clone https://github.com/Cacti/plugin_thold.git cacti/plugins/thold
echo ""
echo -e "\033[32m Upgrading Routerconfigs..."
echo -e -n "\033[0m"
git clone https://github.com/Cacti/plugin_routerconfigs.git cacti/plugins/routerconfigs
echo ""
echo -e "\033[32m Upgrading FlowView..."
echo -e -n "\033[0m"
git clone https://github.com/Cacti/plugin_flowview.git cacti/plugins/flowview
echo ""
echo -e "\033[32m Upgrading Maint..."
echo -e -n "\033[0m"
git clone https://github.com/Cacti/plugin_maint.git cacti/plugins/maint
echo ""
echo -e "\033[32m Upgrading Audit..."
echo -e -n "\033[0m"
git clone https://github.com/Cacti/plugin_audit.git cacti/plugins/audit
echo ""
echo -e "\033[32m Upgrading Cycle..."
echo -e -n "\033[0m"
git clone https://github.com/Cacti/plugin_cycle.git cacti/plugins/cycle
echo ""
#echo "Upgrading Weathermap..."
#echo -e -n "\033[0m"
#git clone https://github.com/howardjones/network-weathermap.git --single-branch cacti/plugins/weathermap
#echo ""
#echo "Installing Weathermap..."
#echo -e -n "\033[0m"
#cd cacti/plugins/weathermap/
#bower install --allow-root
#composer update --no-dev
#echo ""
}

function update-config () {
echo -e "\033[32m Updating cacti config..."
echo -e -n "\033[0m"
cd /var/www/html/
if [ -f  cacti/include/config.php ];
then
	echo "$(awk '{sub(/cactiuser/,"cacti")}1' cacti/include/config.php)" > cacti/include/config.php
else
	mv cacti/include/config.php.dist cacti/include/config.php
	echo "$(awk '{sub(/cactiuser/,"cacti")}1' cacti/include/config.php)" > cacti/include/config.php
fi
}

function update-syslog-config () {
echo -e "\033[32m Updating syslog plugin config..."
echo -e -n "\033[0m"
cd /var/www/html/
cp cacti/plugins/syslog/config.php.dist cacti/plugins/syslog/config.php
echo "$(awk '{sub(/cactiuser/,"cacti")}1' cacti/plugins/syslog/config.php)" > cacti/plugins/syslog/config.php
}

function update-permissions () {
echo -e "\033[32m Fixing file permissions..."
echo -e -n "\033[0m"
sudo chgrp -R apache /var/www/html
sudo chown -R cacti /var/www/html
sudo find /var/www/html -type d -exec chmod g+rx {} +
sudo find /var/www/html -type f -exec chmod g+r {} +
sudo find /var/www/html -type d -exec chmod u+rwx {} +
sudo find /var/www/html -type f -exec chmod u+rw {} +
sudo find /var/www/html -type d -exec chmod g+s {} +
touch /var/www/html/cacti/log/cacti.log
chmod g+w cacti/log/cacti.log
}

function upgrade-spine () {
echo -e "\033[32m Upgrading spine..."
echo -e -n "\033[0m"
sudo yum install gcc glibc glibc-common gd gd-devel -y
cd
wget -q https://www.cacti.net/downloads/spine/cacti-spine-$prod_version.tar.gz
if [ $? -ne 0 ];then
                echo -e "\033[31m Spine download error cannot install..."
                echo -e -n "\033[0m"
else
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
fi
}

function compress-delete () {
	echo -e "\033[32m Do you want to archive the original cacti directory?"
	echo -e -n "\033[0m"
	read -n 1 -p "y/n: " cleanup
        if [ "$cleanup" = "y" ]; then
		echo -e "\033[32m Creating compressed archive..."
		echo -e -n "\033[0m"
		tar -pczf ~/backup_cacti-$cactiver.tar.gz -C /var/www/html/ cacti_$cactiver
		if [ $? -ne 0 ];then
			echo -e "\033[31m Archive creation failed."
			echo -e -n "\033[0m"
		else
			rm -rf /var/www/html/cacti_$cactiver
			echo -e "\033[32m Archive created in home directory ~/backup_cacti-$cactiver.tar.gz..."
			echo -e -n "\033[0m"			
		fi
        elif [ "$cleanup" = "n" ]; then
		echo ""
        else
		echo -e "\033[31m You have entered an invallid selection!"
		echo "Please try again!"
		echo -e -n "\033[0m"
            clear
	fi
}

function update-cactidir () {
if version_lt $cactiver $symlink_cactidir; then
	echo -e "\033[32m Legacy cacti install directory found, updating..."
	echo -e -n "\033[0m"
	rm /var/www/html/cacti
	if [ $? -ne 0 ];then
		echo -e "\033[31m cacti directory update failed, exiting."
		echo -e -n "\033[0m"
		exit 1
	else
	mv /var/www/html/cacti-$cactiver /var/www/html/cacti
	fi
fi
}

function check-smokeping () {
#get the smokeping version
smokeping_version=2.006011
smokeping-prod_version=2.007002
smokeping-web_version=2.7.2
smokever=$( /opt/smokeping/bin/smokeping --version )
if [ $? -ne 0 ];then
	echo -e "\033[31m Smokeping is either not installed or not compatible with minimum required v$upgrade_version cannot proceed, exiting..."
	echo -e -n "\033[0m"
	exit 1
fi
if version_ge $smokever $smokeping_version; then
        if version_ge $smokever $smokeping-prod_version; then
                echo -e "\033[32m Smokeping v$smokever is up to date with production v$smokeping_version, nothing to do, exiting!"
		echo -e -n "\033[0m"
                exit 0
        else
		echo -e "\033[32m Installed Smokeping v$smokever is greater than required v$smokeping-upgrade_version! Upgrading to v$smokeping-prod_version..."
		echo -e -n "\033[0m"
		bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/smokeping-upgrade.sh)

        fi
else
	echo -e "\033[31m Smokeping v$smokever is less than upgrade version v$smokeping-upgrade_version cannot install, exiting..."
	echo -e -n "\033[0m"
	exit 1
fi
}

#upgrade-git
check-permissions
backup-db
update-cactidir
upgrade-cacti
upgrade-spine
#upgrade-plugins
compress-delete
echo -e "\033[32m Cacti upgraded to v$prod_version. Proceed to the web interface to complete upgrade..."
echo -e -n "\033[0m"
exit 0
