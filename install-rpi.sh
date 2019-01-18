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
cactiver=$( cat /var/www/html/cacti/include/cacti_version )
if [ $? -ne 1 ];then
	echo -e "\033[31m Cacti is already installed, cannot proceed..."
	echo -e -n "\033[0m"
	exit 1
fi
if [[ $1 == "develop" ]]; then
	prod_version=( curl -s https://raw.githubusercontent.com/Cacti/cacti/develop/include/cacti_version )
fi

echo -e "\033[32m This script installs all prerequisites and sets up Cacti."
echo -e "\033[32m This\033[31m ONLY\033[32m works on a brand new clean install of Raspian without any changes or updates."
echo -e "\033[32m Use only at your own risk!"
echo -e -n "\033[0m"

installask () {
          echo -e "\033[32m"
	  read -n 1 -p "Are you\033[31m REALLY\033[32m sure you want to install?\033[0m y/n: " install
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
echo -e -n "\033[0m"

echo -e "\033[32m Updating Raspian, this will take a while..."
echo -e -n "\033[0m"
sudo apt -y -qq update; sudo apt -y -qq upgrade
if [ $? -ne 0 ];then
	echo -e "\033[31m Something went wrong updating Raspian, exiting..."
	echo -e -n "\033[0m"
	exit 1
fi

echo -e "\033[32m Installing prerequisites, this will take a while too..."
echo -e -n "\033[0m"
sudo apt -y -qq install unattended-upgrades php libapache2-mod-php php-mbstring php-gmp mariadb-server mariadb-client php-mysql php-curl php-net-socket php-gd php-intl php-pear php-imap php-memcache php-pspell php-recode php-tidy php-xmlrpc php-snmp php-mbstring php-gettext php-gmp php-json php-xml php-common snmp snmpd snmp-mibs-downloader rrdtool php-ldap php-snmp sendmail gcc libssl-dev libmariadbclient-dev libperl-dev libsnmp-dev help2man default-libmysqlclient-dev
if [ $? -ne 0 ];then
	echo -e "\033[31m Something went wrong installing prerequisites, exiting..."
	echo -e -n "\033[0m"
	exit 1
fi

echo -e "\033[32m Setting up Cacti user, get ready to enter a password!!"
echo -e -n "\033[0m"
sudo adduser cacti 
if [ $? -ne 0 ];then
	echo -e "\033[31m Something went wrong setting up Cacti user, exiting..."
	echo -e -n "\033[0m"
	exit 1
else
	sudo usermod -aG sudo cacti && sudo usermod -aG www-data cacti
	if [ $? -ne 0 ];then
		echo -e "\033[31m Something went wrong adding Cacti user groups, exiting..."
		echo -e -n "\033[0m"
		exit 1
	fi
fi

func_dbask () {
          echo -e "\033[32m"
	  read -n 1 -p "Enter \033[31m 1\033[32m to use an untouched Cacti DB or \033[31m 2\033[32m to use Kevin's tweaked DB\033[0m y/n: " db
        if [ "$db" = "1" ]; then
		sudo mysql cacti < /var/www/html/cacti/cacti.sql
	elif [ "$db" = "2" ]; then
		curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/rpi-template/mysql.cacti_clean.sql | sudo mysql cacti
		if [ $? -ne 0 ];then
			echo -e "\033[31m Something went wrong importing Cacti database, exiting..."
			echo -e -n "\033[0m"
		exit 1
		fi
	else
		echo ""
		echo -e "\033[31m Not a valid selection, please try again..."
		echo -e -n "\033[0m"
		func_dbask
	fi
}
func_dbask


echo -e "\033[32m Setting up Cacti database"
echo -e -n "\033[0m"
sudo mysql -u root -e "create database cacti";
if [ $? -ne 0 ];then
	echo -e "\033[31m Something went wrong setting up Cacti database, exiting..."
	echo -e -n "\033[0m"
	exit 1
fi
func_dbask
	sudo mysql -e "GRANT ALL PRIVILEGES ON cacti.* TO cacti@localhost IDENTIFIED BY 'cacti'";
	sudo mysql -e "GRANT SELECT ON mysql.time_zone_name TO 'cacti'@'localhost'";
	sudo mysql -e "flush privileges";
fi
mysql_tzinfo_to_sql /usr/share/zoneinfo | sudo mysql mysql
if [ $? -ne 0 ];then
	echo -e "\033[31m Something went wrong importing timezone data, exiting..."
	exit 1
fi

echo -e "\033[32m Enabling local SNMP"
echo -e -n "\033[0m"
sudo sed -i 's/#mibs/mibs/g' /etc/snmp/snmp.conf
if [ $? -ne 0 ];then
	echo -e "\033[31m Something went wrong enabling SNMP, exiting..."
	echo -e -n "\033[0m"
	exit 1
fi

echo -e "\033[32m Updating mysql for Cacti v1.2.x"
echo -e -n "\033[0m"
test -e /etc/mysql/my.cnf
if [ $? -ne 0 ];then
	echo -e "\033[31m MySQL does not appear to be setup, exiting..."
	echo -e -n "\033[0m"
	exit 1
else
	sudo sed -i '$ a [mysqld]' /etc/mysql/my.cnf
	sudo sed  -i '$ a join_buffer_size=14M' /etc/mysql/my.cnf
	sudo sed  -i '$ a innodb_flush_log_at_timeout=3' /etc/mysql/my.cnf
	sudo sed  -i '$ a innodb_read_io_threads=32' /etc/mysql/my.cnf
	sudo sed  -i '$ a innodb_write_io_threads=16' /etc/mysql/my.cnf
	sudo systemctl restart mysql
	if [ $? -ne 0 ];then
		echo -e "\033[31m MySQL service did not restart as expected attempting again..."
		echo -e -n "\033[0m"
		sudo systemctl restart mysql
	fi	
fi

echo -e "\033[32m Setting up Cacti"
echo -e -n "\033[0m"
wget -q https://github.com/Cacti/cacti/archive/release/$prod_version.tar.gz
if [ $? -ne 0 ];then
	echo -e "\033[31m Something went wrong downloading Cacti, exiting..."
	echo -e -n "\033[0m"
	exit 1
else
	tar xzf $prod_version.tar.gz
	rm  $prod_version.tar.gz
	sudo mv cacti-release-$prod_version/ /var/www/html/cacti
	touch /var/www/html/cacti/log/cacti.log
	mv /var/www/html/cacti/include/config.php.dist /var/www/html/cacti/include/config.php
	sudo sed -i 's/cactiuser/cacti/g' /var/www/html/cacti/include/config.php
fi

echo -e "\033[32m Updating Apache permissions"
echo -e -n "\033[0m"
sudo chown -R www-data:www-data /var/www/html/
if [ $? -ne 0 ];then
	echo -e "\033[31m Something went updating permissions, exiting..."
	echo -e -n "\033[0m"
	exit 1
else
	sudo chmod -R g+w /var/www/html/
		if [ $? -ne 0 ];then
			echo -e "\033[31m Something went updating permissions, exiting..."
			echo -e -n "\033[0m"
			exit 1
		else
			sudo find /var/www/html -type d -exec chmod g+rwx {} +
			sudo find /var/www/html -type f -exec chmod g+rw {} +
			sudo find /var/www/html -type d -exec chmod u+rwx {} +
			sudo find /var/www/html -type f -exec chmod u+rw {} +
			sudo find /var/www/html -type d -exec chmod g+s {} +
			#sudo find /var/www/html -type f -exec chmod g+s {} +
		fi	
fi
function version_ge() { test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" == "$1"; }
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
wget -q https://www.cacti.net/downloads/spine/cacti-spine-$prod_version.tar.gz
			if [ $? -ne 0 ];then
				echo -e "\033[31m ERROR downloading Spine, exiting..."
				echo -e -n "\033[0m"
				exit 1
			else
				tar xzf cacti-spine-$prod_version.tar.gz
				rm cacti-spine-$prod_version.tar.gz
				cd cacti-spine-$prod_version
				./configure
				make
				sudo make install
				sudo chown root:root /usr/local/spine/bin/spine && sudo chmod +s /usr/local/spine/bin/spine
				sudo mv /usr/local/spine/etc/spine.conf.dist /usr/local/spine/etc/spine.conf
				sudo sed -i 's/cactiuser/cacti/g' /usr/local/spine/etc/spine.conf
				cd
				rm -rf cacti-spine-$prod_version

			fi


echo -e "\033[32m Installing Cacti Crontab"
echo -e -n "\033[0m"
echo "*/1 * * * *     /usr/bin/php -q /var/www/html/cacti/poller.php --force" > mycron
sudo crontab -u cacti mycron
	if [ $? -ne 0 ];then
		echo -e "\033[31m ERROR setting up Cacti crontab entry, Cacti poller will not run."
		echo -e -n "\033[0m"
	else
		rm mycron
	fi

echo -e "\033[32m All Done!"
echo -e -n "\033[0m"

func_reboot () {
	read -n 1 -p "\033[32m You must reboot to complete Cacti setup. Reboot now? y/n: " rebootnow
        if [ "$rebootnow" = "y" ]; then
	echo -e "\033[32m Rebooting, see you soon!"
	sudo reboot
	elif [ "$rebootnow" = "n" ]; then
		echo ""
		echo -e "\033[32m Don't forget to reboot or your graphs may not display propery. exiting..."
		echo -e -n "\033[0m"
		exit 1
	else
		echo ""
		echo -e "\033[31m Not a valid selection, please try again..."
		echo -e -n "\033[0m"
		func_reboot
	fi
}
func_reboot
