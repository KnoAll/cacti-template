#!/bin/bash

sudo apt update; sudo apt -y upgrade
sudo apt -y install unattended-upgrades php libapache2-mod-php php-mbstring php-gmp mariadb-server mariadb-client php-mysql php-curl php-net-socket php-gd php-intl php-pear php-imap php-memcache php-pspell php-recode php-tidy php-xmlrpc php-snmp php-mbstring php-gettext php-gmp php-json php-xml php-common snmp snmpd snmp-mibs-downloader rrdtool php-ldap php-snmp sendmail gcc libssl-dev libmariadbclient-dev libperl-dev libsnmp-dev help2man default-libmysqlclient-dev

sudo adduser cacti
sudo usermod -aG sudo cacti && sudo usermod -aG www-data cacti

sudo mysql -u root -e "create database cacti";
curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/rpi-template/mysql.cacti_v1.2.0-clean.sql | sudo mysql cacti
sudo mysql -e "GRANT ALL PRIVILEGES ON cacti.* TO cacti@localhost IDENTIFIED BY 'cacti'";
sudo mysql -e "GRANT SELECT ON mysql.time_zone_name TO 'cacti'@'localhost'";
sudo mysql -e "flush privileges";

mysql_tzinfo_to_sql /usr/share/zoneinfo | sudo mysql mysql

sudo sed -i 's/#mibs/mibs/g' /etc/snmp/snmp.conf

sudo sed -i '$ a [mysqld]' /etc/mysql/my.cnf
sudo sed  -i '$ a join_buffer_size=14M' /etc/mysql/my.cnf
sudo sed  -i '$ a innodb_flush_log_at_timeout=3' /etc/mysql/my.cnf
sudo sed  -i '$ a innodb_read_io_threads=32' /etc/mysql/my.cnf
sudo sed  -i '$ a innodb_write_io_threads=16' /etc/mysql/my.cnf
sudo systemctl restart mysql
		
wget https://github.com/Cacti/cacti/archive/release/1.2.0.tar.gz
tar xzf 1.2.0.tar.gz
sudo mv cacti-release-1.2.0/ /var/www/html/cacti
touch /var/www/html/cacti/log/cacti.log
mv /var/www/html/cacti/include/config.php.dist /var/www/html/cacti/include/config.php
sudo sed -i 's/cactiuser/cacti/g' /var/www/html/cacti/include/config.php

sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R g+w /var/www/html/

sudo find /var/www/html -type d -exec chmod g+rwx {} +
sudo find /var/www/html -type f -exec chmod g+rw {} +
sudo find /var/www/html -type d -exec chmod u+rwx {} +
sudo find /var/www/html -type f -exec chmod u+rw {} +
sudo find /var/www/html -type d -exec chmod g+s {} +

sudo sed -i 's/;date.timezone =/date.timezone="America\/Los_Angeles"/g' /etc/php/7.0/apache2/php.ini
#users will have to go manually change this		
sudo sed -i 's/max_execution_time = 30/max_execution_time = 60/g' /etc/php/7.0/apache2/php.ini
sudo sed -i 's/memory_limit = 128/memory_limit = 400/g' /etc/php/7.0/apache2/php.ini
sudo systemctl restart apache2

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

*/1 * * * *     /usr/bin/php -q /var/www/html/cacti/poller.php --force
