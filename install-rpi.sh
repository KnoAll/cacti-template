#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/rpi-template/install-rpi.sh)

echo -e "\033[31m Updating Raspian"
echo -e -n "\033[0m"
sudo apt update; sudo apt -y upgrade
    echo -e "\033[31m Installing prerequisites"
echo -e -n "\033[0m"
sudo apt -y install unattended-upgrades php libapache2-mod-php php-mbstring php-gmp mariadb-server mariadb-client php-mysql php-curl php-net-socket php-gd php-intl php-pear php-imap php-memcache php-pspell php-recode php-tidy php-xmlrpc php-snmp php-mbstring php-gettext php-gmp php-json php-xml php-common snmp snmpd snmp-mibs-downloader rrdtool php-ldap php-snmp sendmail gcc libssl-dev libmariadbclient-dev libperl-dev libsnmp-dev help2man default-libmysqlclient-dev

echo -e "\033[31m Setting up Cacti user"
echo -e -n "\033[0m"
sudo adduser cacti
sudo usermod -aG sudo cacti && sudo usermod -aG www-data cacti

echo -e "\033[31m Setting up Cacti database"
echo -e -n "\033[0m"
sudo mysql -u root -e "create database cacti";
curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/rpi-template/mysql.cacti_v1.2.0-clean.sql | sudo mysql cacti
sudo mysql -e "GRANT ALL PRIVILEGES ON cacti.* TO cacti@localhost IDENTIFIED BY 'cacti'";
sudo mysql -e "GRANT SELECT ON mysql.time_zone_name TO 'cacti'@'localhost'";
sudo mysql -e "flush privileges";

mysql_tzinfo_to_sql /usr/share/zoneinfo | sudo mysql mysql

echo -e "\033[31m Enabling local SNMP"
echo -e -n "\033[0m"
sudo sed -i 's/#mibs/mibs/g' /etc/snmp/snmp.conf

echo -e "\033[31m Updating mysql for Cacti v1.2.x"
echo -e -n "\033[0m"
sudo sed -i '$ a [mysqld]' /etc/mysql/my.cnf
sudo sed  -i '$ a join_buffer_size=14M' /etc/mysql/my.cnf
sudo sed  -i '$ a innodb_flush_log_at_timeout=3' /etc/mysql/my.cnf
sudo sed  -i '$ a innodb_read_io_threads=32' /etc/mysql/my.cnf
sudo sed  -i '$ a innodb_write_io_threads=16' /etc/mysql/my.cnf
sudo systemctl restart mysql

echo -e "\033[31m Setting up Cacti"
echo -e -n "\033[0m"
wget https://github.com/Cacti/cacti/archive/release/1.2.0.tar.gz
tar xzf 1.2.0.tar.gz
sudo mv cacti-release-1.2.0/ /var/www/html/cacti
touch /var/www/html/cacti/log/cacti.log
mv /var/www/html/cacti/include/config.php.dist /var/www/html/cacti/include/config.php
sudo sed -i 's/cactiuser/cacti/g' /var/www/html/cacti/include/config.php

echo -e "\033[31m Updating Apache permissions"
echo -e -n "\033[0m"
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R g+w /var/www/html/

sudo find /var/www/html -type d -exec chmod g+rwx {} +
sudo find /var/www/html -type f -exec chmod g+rw {} +
sudo find /var/www/html -type d -exec chmod u+rwx {} +
sudo find /var/www/html -type f -exec chmod u+rw {} +
sudo find /var/www/html -type d -exec chmod g+s {} +

echo -e "\033[31m Updating PHP Timezone"
echo -e -n "\033[0m"
sudo sed -i 's/;date.timezone =/date.timezone="America\/Los_Angeles"/g' /etc/php/7.0/apache2/php.ini
#users will have to go manually change this
echo -e "\033[31m Updating Apache Settings for Cacti 1.2.x"
echo -e -n "\033[0m"
sudo sed -i 's/max_execution_time = 30/max_execution_time = 60/g' /etc/php/7.0/apache2/php.ini
sudo sed -i 's/memory_limit = 128/memory_limit = 400/g' /etc/php/7.0/apache2/php.ini
sudo systemctl restart apache2

echo -e "\033[31m Setting up Spine"
echo -e -n "\033[0m"
# spine
wget https://www.cacti.net/downloads/spine/cacti-spine-1.2.0.tar.gz
tar xzf cacti-spine-1.2.0.tar.gz
cd cacti-spine-1.2.0
./configure
make
sudo make install
sudo chown root:root /usr/local/spine/bin/spine && sudo chmod +s /usr/local/spine/bin/spine
sudo mv /usr/local/spine/etc/spine.conf.dist /usr/local/spine/etc/spine.conf
sudo sed -i 's/cactiuser/cacti/g' /usr/local/spine/etc/spine.conf


echo -e "\033[31m Installing Cacti Crontab"
echo -e -n "\033[0m"
sudo -u cacti -s
cd
*/1 * * * *     /usr/bin/php -q /var/www/html/cacti/poller.php --force


echo -e "\033[31m All Done!"
echo -e -n "\033[0m"
