#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/install/install.sh)

if [[ `whoami` == "root" ]]; then
    echo -e "\033[31m You ran me as root! Do not run me as root!"
    echo -e -n "\033[0m"
    exit 1
elif grep -q "Raspbian GNU/Linux 10" /etc/os-release; then
	if [[ `whoami` != "pi" ]]; then
		echo -e "\033[31m Uh-oh. You are not logged in as the default pi user. Exiting..."
		echo -e -n "\033[0m"
		exit 1
	else
		os_dist=raspbian
		os_name=Raspbian
		webserver=apache2
	fi
elif grep -q "CentOS Linux 7" /etc/os-release; then
	if [[ `whoami` != "cacti" ]]; then
		echo -e "\033[31m Uh-oh. You are not logged in as the default cacti user. Exiting..."
		echo -e -n "\033[0m"
		exit 1
	else
		os_dist=centos
		os_name=CentOS7
		webserver=httpd
	fi
else
    echo -e "\033[31m Uh-oh. We don't appear to be on a supported OS. Exiting..."
    echo -e -n "\033[0m"
    exit 1
fi

if [[ $1 == "dev" ]]; then
	param1=$1
	param2=$2
	branch=dev
	echo -e "\033[31m Now on DEV script."
	echo -e -n "\033[0m"
	if [[ $2 == "develop" ]]; then
		prod_version=$( curl -s https://raw.githubusercontent.com/Cacti/cacti/develop/include/cacti_version )
		echo -e "\033[31m Switching to DEVELOP version v$prod_version via git..."
		echo -e -n "\033[0m"
	fi
else
	branch=master
fi

# get the Cacti version
# get ready for dynamic update
#prod_version=( curl -s https://raw.githubusercontent.com/Cacti/cacti/master/include/cacti_version )
prod_version=1.2.5
test -f /var/www/html/cacti/include/cacti_version
if [ $? -ne 1 ];then
	echo -e "\033[31m Cacti is already installed, cannot proceed..."
	echo -e -n "\033[0m"
	exit 1
fi
if [[ $1 == "develop" ]]; then
	prod_version=( curl -s https://raw.githubusercontent.com/Cacti/cacti/develop/include/cacti_version )
fi

echo -e "\033[32m This script installs all prerequisites and sets up Cacti v$prod_version."
echo -e "\033[32m This\033[31m ONLY\033[32m works on a brand new clean install of $os_name without any changes or updates."
echo -e "\033[32m Use only at your own risk!"
echo -e -n "\033[0m"

installask () {
          echo -e "\033[32m"
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

echo -e "\033[32m Welcome to Kevin's CentOS7/RaspberryPi Cacti install script!"
echo -e -n "\033[0m"

echo -e "\033[32m Updating $os_name, this may take a while..."
echo -e -n "\033[0m"
if [[ $os_dist == "raspbian" ]]; then
	sudo apt -y -qq update; sudo apt -y -qq upgrade
	if [ $? -ne 0 ];then
		echo -e "\033[31m Something went wrong updating Raspbian, exiting..."
		echo -e -n "\033[0m"
		exit 1
	fi
elif [[ $os_dist == "centos" ]]; then
	sudo yum -y -q update; sudo yum -y -q upgrade
	if [ $? -ne 0 ];then
		echo -e "\033[31m Something went wrong updating CentOS, exiting..."
		echo -e -n "\033[0m"
		exit 1
	fi
else
    echo -e "\033[31m Uh-oh. We don't appear to be on a supported OS. Exiting..."
    echo -e -n "\033[0m"
    exit 1
fi

echo -e "\033[32m Installing prerequisites, this may take a while too..."
echo -e -n "\033[0m"
if [[ $os_dist == "raspbian" ]]; then
	sudo apt -y -qq install autoconf dos2unix unattended-upgrades php libapache2-mod-php php-mbstring php-gmp mariadb-server mariadb-client php-mysql php-curl php-net-socket php-gd php-intl php-pear php-imap php-memcache php-pspell php-recode php-tidy php-xmlrpc php-snmp php-mbstring php-gettext php-gmp php-json php-xml php-common snmp snmpd snmp-mibs-downloader rrdtool php-ldap php-snmp sendmail gcc libssl-dev libmariadbclient-dev libperl-dev libsnmp-dev help2man default-libmysqlclient-dev git
	if [ $? -ne 0 ];then
		echo -e "\033[31m Something went wrong installing prerequisites, exiting..."
		echo -e -n "\033[0m"
		exit 1
	else
		echo -e "\033[32m Enabling webserver and mysql server..."
		echo -e -n "\033[0m"
		sudo systemctl start apache2 && sudo systemctl enable apache2 && sudo systemctl start mariadb && sudo systemctl enable mariadb
	fi
elif [[ $os_dist == "centos" ]]; then
	curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
	sudo sed -i 's/enforcing/permissive/g' /etc/selinux/config
	sudo yum install -y -q httpd php php-mysql MariaDB-server MariaDB-shared rrdtool net-snmp net-snmp-utils autoconf automake libtool dos2unix help2man openssl-devel MariaDB-devel net-snmp-devel nano wget git php-gd php-mbstring php-snmp php-ldap php-posix
	if [ $? -ne 0 ];then
		echo -e "\033[31m Something went wrong installing prerequisites, exiting..."
		echo -e -n "\033[0m"
		exit 1
	else
		echo -e "\033[32m Enabling webserver and mysql server..."
		echo -e -n "\033[0m"
		sudo systemctl start httpd && sudo systemctl enable httpd && sudo systemctl start mariadb && sudo systemctl enable mariadb
	fi
fi

if [[ $os_dist == "raspbian" ]]; then
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
elif [[ $os_dist == "centos" ]]; then
	echo -e "\033[32m Checking Cacti user groups..."
	echo -e -n "\033[0m"
	groups | grep -q wheel
	if [ $? -ne 0 ];then
		echo -e "\033[31m Cacti is not in the suoders group, cannot proceed..."
		echo -e -n "\033[0m"
		exit 1
	else
		sudo usermod -a -G apache cacti
		if [ $? -ne 0 ];then
			echo -e "\033[31m Something went wrong adding Cacti user to apache group, exiting..."
			echo -e -n "\033[0m"
			exit 1
		fi
	fi
fi

func_dbask () {
          echo -e "\033[32m Enter 1 to use an untouched Cacti DB or 2 to use Kevin's tweaked DB: "
	  read -n 1 -p "1/2: " db
        if [ "$db" = "1" ]; then
		echo ""
		echo -e "\033[32m Setting up default db..."
		echo -e -n "\033[0m"
		curl -s https://raw.githubusercontent.com/Cacti/cacti/master/cacti.sql | sudo mysql cacti
		#sudo mysql cacti < /var/www/html/cacti/cacti.sql
		if [ $? -ne 0 ];then
			echo -e "\033[31m Something went wrong importing Cacti database, exiting..."
			echo -e -n "\033[0m"
			exit 1
		else
		echo -e "\033[32m Imported Cacti db. The default username/password is admin and admin."
		echo -e -n "\033[0m"
		counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=db-cacti&write=0 )
		fi
	elif [ "$db" = "2" ]; then
		echo ""
		echo -e "\033[32m Importing Kevin's tweaked db..."
		echo -e -n "\033[0m"
		curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/install/mysql.cacti_clean.sql | sudo mysql cacti
		if [ $? -ne 0 ];then
			echo -e "\033[31m Something went wrong importing Cacti database, exiting..."
			echo -e -n "\033[0m"
			exit 1
		else
		echo -e "\033[32m The default username/password is admin and Cactipw1! (including the exclamation)."
		echo -e -n "\033[0m"
		counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=db-kevin&write=0 )
		fi
	else
		echo ""
		echo -e "\033[31m Not a valid selection, please try again..."
		echo -e -n "\033[0m"
		func_dbask
	fi
}

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

echo -e "\033[32m Setting up MYSQL timezone entires..."
echo -e -n "\033[0m"
mysql_tzinfo_to_sql /usr/share/zoneinfo | sudo mysql mysql
if [ $? -ne 0 ];then
	echo -e "\033[31m Something went wrong importing timezone data, exiting..."
	exit 1
fi

echo -e "\033[32m Enabling local SNMP"
echo -e -n "\033[0m"
if [[ $os_dist == "raspbian" ]]; then
	sudo sed -i 's/#mibs/mibs/g' /etc/snmp/snmp.conf
	if [ $? -ne 0 ];then
		echo -e "\033[31m Something went wrong enabling SNMP, exiting..."
		echo -e -n "\033[0m"
		exit 1
	else
	sudo systemctl start snmpd && sudo systemctl enable snmpd
		if [ $? -ne 0 ];then
			echo -e "\033[31m Something went wrong enabling SNMP, exiting..."
			echo -e -n "\033[0m"
			exit 1
		fi
	fi
elif [[ $os_dist == "centos" ]]; then
	sudo sed -i 's/OPTIONS="-LS0-6d"/OPTIONS="-Ls3d"/g' /etc/sysconfig/snmpd
	sudo systemctl start snmpd && sudo systemctl enable snmpd
	if [ $? -ne 0 ];then
		echo -e "\033[31m Something went wrong enabling SNMP, exiting..."
		echo -e -n "\033[0m"
		exit 1
	fi
fi

echo -e "\033[32m Updating mysql for Cacti v1.2.x"
if [[ $os_dist == "raspbian" ]]; then
	mycnf_path=/etc/mysql/my.cnf
	dbserver=mysql
elif [[ $os_dist == "centos" ]]; then
	mycnf_path=/etc/my.cnf
	dbserver=mariadb
fi
grep -q -w "mysqld" $mycnf_path
if [ $? -ne 0 ];then
	#Fugly but works for now...
	sudo sed  -i '$ a [mysqld]' $mycnf_path
	sudo sed  -i '$ a max_allowed_packet=16M' $mycnf_path
#	sudo sed  -i '$ a innodb_additional_mem_pool_size=80M' $mycnf_path 
	sudo sed  -i '$ a innodb_flush_log_at_timeout=3' $mycnf_path 
	sudo sed  -i '$ a innodb_read_io_threads=32' $mycnf_path
	sudo sed  -i '$ a innodb_write_io_threads=16' $mycnf_path 
	sudo sed  -i '$ a max_heap_table_size=30M' $mycnf_path 
	sudo sed  -i '$ a tmp_table_size=30M' $mycnf_path 
	sudo sed  -i '$ a join_buffer_size=58M' $mycnf_path 
	sudo sed  -i '$ a innodb_buffer_pool_size=250M' $mycnf_path 
	sudo sed  -i '$ a character-set-server=utf8mb4' $mycnf_path 
	sudo sed  -i '$ a collation-server=utf8mb4_unicode_ci' $mycnf_path 
	sudo sed  -i '$ a max_allowed_packet=16M' $mycnf_path
	sudo sed  -i '$ a innodb_buffer_pool_instances=5' $mycnf_path 
	sudo systemctl restart $dbserver.service
		if [ $? -ne 0 ];then
		echo -e "\033[31m Something went wrong restarting mysql, exiting..."
		echo -e -n "\033[0m"
		exit 1
		fi
else
	echo "my.cnf already has mysqld entry"
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
	if [[ $1 == "dev" ]]; then
		echo ""	
	else
		counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=cacti-install-$prod_version&write=0 )
		echo ""
		echo ""
		counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=cacti-install-$os_dist&write=0 )
		echo ""
		echo ""
	fi
fi

# fixup permissions
bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/update-permissions.sh)

function update-php () {
echo -e "\033[32m Updating php settings for cacti v1.2.x..."
echo -e -n "\033[0m"
if [[ $os_dist == "raspbian" ]]; then
	phpini_path=/etc/php/7.0/apache2/php.ini
	phpcliini_path=/etc/php/7.0/cli/php.ini
elif [[ $os_dist == "centos" ]]; then
	phpini_path=/etc/php.ini
	echo -e "\033[32m Allowing http/s access through firewall..."
	echo -e -n "\033[0m"
	sudo firewall-cmd --add-service=http --permanent && sudo firewall-cmd --add-service=https --permanent
	sudo systemctl restart firewalld
fi
grep -q -w "memory_limit = 128M" $phpini_path
	if [ $? -ne 0 ];then
		grep -q -w "memory_limit = 400M" $phpini_path
		if [ $? -ne 0 ];then
			echo -e "\033[31m php memory_limit neither 128 or 800, cannot update..."
			echo -e -n "\033[0m"
		else
			echo -e "\033[32m php memory_limit already = 400."
			echo -e -n "\033[0m"
		fi
	else
		sudo sed -i 's/memory_limit = 128M/memory_limit = 800M/g' $phpini_path
		if [ $? -ne 0 ];then
			echo -e "\033[31m ERROR, php memory_limit NOT updated."
			echo -e -n "\033[0m"
		else
			echo -e "\033[32m php memory_limit updated to 800."
			echo -e -n "\033[0m"
		fi
	fi
grep -q -w "max_execution_time = 30" $phpini_path
	if [ $? -ne 0 ];then
		#NOT 128, check for 800
		grep -q -w "max_execution_time = 60" $phpini_path
		if [ $? -ne 0 ];then
			echo -e "\033[31m php max_execution_time neither 30 or 60, cannot update..."
			echo -e -n "\033[0m"
		else
			echo -e "\033[32m php max_execution_time already = 60."
			echo -e -n "\033[0m"
		fi
	else
		sudo sed -i 's/max_execution_time = 30/max_execution_time = 60/g' $phpini_path
				if [ $? -ne 0 ];then
					echo -e "\033[31m ERROR, php max_execution_time NOT updated."
					echo -e -n "\033[0m"
				else
					echo -e "\033[32m php max_execution_time updated to 60."
					echo -e -n "\033[0m"
				fi
	fi

grep -q -w ";date.timezone =" $phpini_path
if [ $? -ne 0 ];then
	grep -q -w "max_execution_time = 60" $phpini_path
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
	sudo sed -i 's/;date.timezone =/date.timezone="America\/Los_Angeles"/g' $phpini_path
	sudo sed -i 's/;date.timezone =/date.timezone="America\/Los_Angeles"/g' $phpcliini_path
	echo -e "\033[31m If you are not in America/Los_Angeles you will need to manually change the timezone using
	'sudo timedatectl set-timezone Your/Zone'
	and
	'sudo sed -i 's/;date.timezone =/date.timezone="Your\/Zone"/g' $phpini_path'
	'sudo sed -i 's/;date.timezone =/date.timezone="Your\/Zone"/g' $phpcliini_path'
	"
	echo -e -n "\033[0m"
fi

echo -e "\033[32m Updating Apache Settings for Cacti 1.2.x"
echo -e -n "\033[0m"
sudo systemctl restart $webserver
}
update-php

echo -e "\033[32m Setting up Spine..."
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
				./bootstrap
				./configure
				make
				sudo make install
				sudo chown root:root /usr/local/spine/bin/spine && sudo chmod +s /usr/local/spine/bin/spine
				sudo mv /usr/local/spine/etc/spine.conf.dist /usr/local/spine/etc/spine.conf
				sudo sed -i 's/cactiuser/cacti/g' /usr/local/spine/etc/spine.conf
				cd
				rm -rf cacti-spine-$prod_version

			fi

echo -e "\033[32m Setting up Plugins..."
echo -e -n "\033[0m"
# plugins
cd /var/www/html/cacti/plugins
sudo -u cacti git clone https://github.com/Cacti/plugin_thold.git thold
sudo -u cacti git clone https://github.com/Cacti/plugin_monitor.git monitor
sudo -u cacti git clone https://github.com/Cacti/plugin_webseer.git webseer

echo -e "\033[32m Installing Cacti Crontab..."
echo -e -n "\033[0m"
cd
echo "*/1 * * * *     /usr/bin/php -q /var/www/html/cacti/poller.php --force" > mycron
sudo crontab -u cacti mycron
	if [ $? -ne 0 ];then
		echo -e "\033[31m ERROR setting up Cacti crontab entry, Cacti poller will not run."
		echo -e -n "\033[0m"
	else
		rm mycron
	fi

echo -e "\033[32m Installing Cacti upgrade script for future use at /home/cacti/cacti-upgrade.sh..."
echo -e -n "\033[0m"
sudo -u cacti wget -q -P /home/cacti/ https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/cacti-upgrade.sh
sudo chmod +x /home/cacti/cacti-upgrade.sh

func_smokeask () {
          echo -e "\033[32m"
	  read -n 1 -p "Would you like to install SmokePing? y/n: " smokeinstall
        if [ "$smokeinstall" = "y" ]; then
		bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/install/smokeping/install-smokeping.sh)
	elif [ "$smokeinstall" = "n" ]; then
		echo ""
		echo -e "\033[32m Thanks for considering, going back..."
		echo -e -n "\033[0m"
	else
		echo ""
		echo -e "\033[31m Not a valid selection, please try again..."
		echo -e -n "\033[0m"
		func_smokeask
	fi
}

case $os_dist in
	raspbian)
		echo -e "\033[32m If you want to install SmokePing check my install script at https://raw.githubusercontent.com/KnoAll/cacti-template/master/install/smokeping"
		echo -e "\033[32m Be sure to check for Cacti updates. After login in as the Cacti user run ~./cacti-update.sh"
		echo -e -n "\033[0m"
	;;
	*)
		func_smokeask
		echo -e "\033[32m Checking for Cacti updates..."
		echo -e -n "\033[0m"
		bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/upgrade-cacti.sh)
	;;
esac

echo -e "\033[32m All Done!"
echo -e -n "\033[0m"

func_reboot () {
	echo -e "\033[32m"
	read -n 1 -p "You must reboot to complete Cacti setup. Reboot now? y/n: " rebootnow
        if [ "$rebootnow" = "y" ]; then
	echo ""
	echo -e "\033[32m Rebooting, see you soon!"
	echo -e -n "\033[0m"
	sudo reboot
	elif [ "$rebootnow" = "n" ]; then
		echo ""
		echo -e "\033[31m Don't forget to reboot or your graphs will not display propery. exiting..."
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
