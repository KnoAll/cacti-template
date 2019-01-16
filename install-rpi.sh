#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/rpi-template/install-rpi.sh)

if [[ `whoami` == "root" ]]; then
    echo -e "\033[31m You ran me as root! Do not run me as root!"
    echo -e -n "\033[0m"
    exit 1
elif [[ `whoami` != "pi" ]]; then
    echo -e "\033[31m Uh-oh. You are not logged in as the default pi user. Exiting..."
    echo -e -n "\033[0m"
    exit 1
elif grep -q ID=raspbian /etc/os-release; then
  	echo ""
else
    echo -e "\033[31m Uh-oh. We don't appear to be on Raspian OS. Exiting..."
    echo -e -n "\033[0m"
    exit 1
fi

# get the Cacti version
# get ready for dynamic update
#prod_version=( curl -s https://raw.githubusercontent.com/Cacti/cacti/master/include/cacti_version )
prod_version=1.2.0
dev_version=1.2.0-beta4
cactiver=$( cat /var/www/html/cacti/include/cacti_version )
if [ $? -ne 1 ];then
	echo -e "\033[31m Cacti is already installed, cannot proceed..."
	echo -e -n "\033[0m"
	exit 1
fi

echo -e "\033[32m This script installs all prerequisites and sets up Cacti. This ONLY works on a brand new clean install of Raspian without any changes or updates. Use only at your own risk!"
installask () {
          read -n 1 -p "Are you REALLY sure you want to install? y/n: " install
        if [ "$install" = "y" ]; then
	echo ""
	elif [ "$install" = "n" ]; then
		echo ""
		echo -e "\033[32m Thanks for considering, exiting now..."
		echo -e -n "\033[0m"
		exit 1
	else
		echo ""
		echo -e "\033[31m Not a valid selection, please try again..."
		echo -e -n "\033[0m"
		installask
	fi

}
installask

echo -e "\033[32m Welcome to Kevin's RaspberryPi Cacti install script!"

echo -e "\033[32m Updating Raspian"
sudo apt update; sudo apt -y upgrade

echo -e "\033[32m Installing prerequisites"
sudo apt -y install unattended-upgrades php libapache2-mod-php php-mbstring php-gmp mariadb-server mariadb-client php-mysql php-curl php-net-socket php-gd php-intl php-pear php-imap php-memcache php-pspell php-recode php-tidy php-xmlrpc php-snmp php-mbstring php-gettext php-gmp php-json php-xml php-common snmp snmpd snmp-mibs-downloader rrdtool php-ldap php-snmp sendmail gcc libssl-dev libmariadbclient-dev libperl-dev libsnmp-dev help2man default-libmysqlclient-dev

echo -e "\033[32m Setting up Cacti user, get ready to enter a password!!"
sudo adduser cacti
sudo usermod -aG sudo cacti && sudo usermod -aG www-data cacti

echo -e "\033[32m Setting up Cacti database"
echo -e -n "\033[0m"
sudo mysql -u root -e "create database cacti";
curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/rpi-template/mysql.cacti_v1.2.0-clean.sql | sudo mysql cacti
sudo mysql -e "GRANT ALL PRIVILEGES ON cacti.* TO cacti@localhost IDENTIFIED BY 'cacti'";
sudo mysql -e "GRANT SELECT ON mysql.time_zone_name TO 'cacti'@'localhost'";
sudo mysql -e "flush privileges";

mysql_tzinfo_to_sql /usr/share/zoneinfo | sudo mysql mysql

echo -e "\033[32m Enabling local SNMP"
echo -e -n "\033[0m"
sudo sed -i 's/#mibs/mibs/g' /etc/snmp/snmp.conf

echo -e "\033[32m Updating mysql for Cacti v1.2.x"
echo -e -n "\033[0m"
sudo sed -i '$ a [mysqld]' /etc/mysql/my.cnf
sudo sed  -i '$ a join_buffer_size=14M' /etc/mysql/my.cnf
sudo sed  -i '$ a innodb_flush_log_at_timeout=3' /etc/mysql/my.cnf
sudo sed  -i '$ a innodb_read_io_threads=32' /etc/mysql/my.cnf
sudo sed  -i '$ a innodb_write_io_threads=16' /etc/mysql/my.cnf
sudo systemctl restart mysql

echo -e "\033[32m Setting up Cacti"
echo -e -n "\033[0m"
wget -q https://github.com/Cacti/cacti/archive/release/1.2.0.tar.gz
tar xzf 1.2.0.tar.gz
rm  1.2.0.tar.gz
sudo mv cacti-release-1.2.0/ /var/www/html/cacti
touch /var/www/html/cacti/log/cacti.log
mv /var/www/html/cacti/include/config.php.dist /var/www/html/cacti/include/config.php
sudo sed -i 's/cactiuser/cacti/g' /var/www/html/cacti/include/config.php

echo -e "\033[32m Updating Apache permissions"
echo -e -n "\033[0m"
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R g+w /var/www/html/

sudo find /var/www/html -type d -exec chmod g+rwx {} +
sudo find /var/www/html -type f -exec chmod g+rw {} +
sudo find /var/www/html -type d -exec chmod u+rwx {} +
sudo find /var/www/html -type f -exec chmod u+rw {} +
sudo find /var/www/html -type d -exec chmod g+s {} +


function update-php () {
if version_ge $prod_version 1.2.0; then
echo -e "\033[32m Updating php settings for cacti v1.2.x..."
echo -e -n "\033[0m"
grep -q -w "memory_limit = 128M" /etc/php/7.0/apache2/php.ini
if [ $? -ne 0 ];then
	grep -q -w "memory_limit = 400M" /etc/php/7.0/apache2/php.ini
	if [ $? -ne 0 ];then
		echo -e "\033[31m php memory_limit neither 128 or 800, cannot update..."
		echo -e -n "\033[0m"
	else
		echo -e "\033[32m php memory_limit already = 400."
		echo -e -n "\033[0m"
	fi
else
        sudo sed -i 's/memory_limit = 128M/memory_limit = 400M/g' /etc/php/7.0/apache2/php.ini
	if [ $? -ne 0 ];then
		echo -e "\033[31m ERROR, php memory_limit NOT updated."
		echo -e -n "\033[0m"
	else
		echo -e "\033[32m php memory_limit updated to 400."
		echo -e -n "\033[0m"
	fi
fi
grep -q -w "max_execution_time = 30" /etc/php/7.0/apache2/php.ini
if [ $? -ne 0 ];then
	#NOT 128, check for 800
	grep -q -w "max_execution_time = 60" /etc/php/7.0/apache2/php.ini
	if [ $? -ne 0 ];then
		echo -e "\033[31m php max_execution_time neither 30 or 60, cannot update..."
		echo -e -n "\033[0m"
	else
		echo -e "\033[32m php max_execution_time already = 60."
		echo -e -n "\033[0m"
	fi
else
        sudo sed -i 's/max_execution_time = 30/max_execution_time = 60/g' /etc/php/7.0/apache2/php.ini
			if [ $? -ne 0 ];then
				echo -e "\033[31m ERROR, php max_execution_time NOT updated."
				echo -e -n "\033[0m"
			else
				echo -e "\033[32m php max_execution_time updated to 60."
				echo -e -n "\033[0m"
			fi
fi
fi

grep -q -w ";date.timezone =" /etc/php/7.0/apache2/php.ini
if [ $? -ne 0 ];then
	grep -q -w "max_execution_time = 60" /etc/php/7.0/apache2/php.ini
	if [ $? -ne 0 ];then
		echo -e "\033[31m php max_execution_time neither 30 or 60, cannot update..."
		echo -e -n "\033[0m"
	else
		echo -e "\033[32m php max_execution_time already = 60."
		echo -e -n "\033[0m"
	fi
else
	echo -e "\033[32m Updating Timezone settings to America/Los_Angeles."
	echo -e -n "\033[0m"
	sudo timedatectl set-timezone America/Los_Angeles
	sudo sed -i 's/;date.timezone =/date.timezone="America\/Los_Angeles"/g' /etc/php/7.0/apache2/php.ini
	echo -e "\033[31m If you are not in America/Los_Angeles you will need to manually change the timezone using
'sudo timedatectl set-timezone Your/Zone'
and
'sudo sed -i 's/;date.timezone =/date.timezone="Your\/Zone"/g' /etc/php/7.0/apache2/php.ini'
"
	echo -e -n "\033[0m"
fi

echo -e "\033[32m Updating Apache Settings for Cacti 1.2.x"
echo -e -n "\033[0m"
#sudo sed -i 's/max_execution_time = 30/max_execution_time = 60/g' /etc/php/7.0/apache2/php.ini
#sudo sed -i 's/memory_limit = 128/memory_limit = 400/g' /etc/php/7.0/apache2/php.ini
sudo systemctl restart apache2
}
update-php

echo -e "\033[32m Setting up Spine"
echo -e -n "\033[0m"
# spine
wget -q https://www.cacti.net/downloads/spine/cacti-spine-1.2.0.tar.gz
tar xzf cacti-spine-1.2.0.tar.gz
rm cacti-spine-1.2.0.tar.gz
cd cacti-spine-1.2.0
./configure
make
sudo make install
sudo chown root:root /usr/local/spine/bin/spine && sudo chmod +s /usr/local/spine/bin/spine
sudo mv /usr/local/spine/etc/spine.conf.dist /usr/local/spine/etc/spine.conf
sudo sed -i 's/cactiuser/cacti/g' /usr/local/spine/etc/spine.conf
cd
rm -rf cacti-spine-1.2.0


echo -e "\033[32m Installing Cacti Crontab"
echo -e -n "\033[0m"
echo "*/1 * * * *     /usr/bin/php -q /var/www/html/cacti/poller.php --force" > mycron
sudo crontab -u cacti mycron
rm mycron


echo -e "\033[32m All Done!"
echo -e -n "\033[0m"
