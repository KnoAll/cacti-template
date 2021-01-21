#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/install/install.sh) dev

green=$(tput setaf 2)
red=$(tput setaf 1)
tan=$(tput setaf 3)
reset=$(tput sgr0)

printinfo() {
	printf "${tan}::: ${green}%s${reset}\n" "$@"
}
printwarn() {
	printf "${tan}*** WARNING: %s${reset}\n" "$@"
}
printerror() {
	printf "${red}!!! ERROR: %s${reset}\n" "$@"
}

welcomeMessage() {
  echo -n "${tan}"
  cat << "EOF"
        CCCCCCCCCCCCC                                              tttt            iiii
     CCC::::::::::::C                                           ttt:::t           i::::i
   CC:::::::::::::::C                                           t:::::t            iiii
  C:::::CCCCCCCC::::C                                           t:::::t
C:::::C       CCCCCC  aaaaaaaaaaaaa      ccccccccccccccccttttttt:::::ttttttt    iiiiiii
C:::::C                a::::::::::::a   cc:::::::::::::::ct:::::::::::::::::t    i:::::i
C:::::C                aaaaaaaaa:::::a c:::::::::::::::::ct:::::::::::::::::t     i::::i
C:::::C                         a::::ac:::::::cccccc:::::ctttttt:::::::tttttt     i::::i
C:::::C                  aaaaaaa:::::ac::::::c     ccccccc      t:::::t           i::::i
C:::::C                aa::::::::::::ac:::::c                   t:::::t           i::::i
C:::::C               a::::aaaa::::::ac:::::c                   t:::::t           i::::i
C:::::C       CCCCCCa::::a    a:::::ac::::::c     ccccccc      t:::::t    tttttt i::::i
  C:::::CCCCCCCC::::Ca::::a    a:::::ac:::::::cccccc:::::c      t::::::tttt:::::ti::::::i
   CC:::::::::::::::Ca:::::aaaa::::::a c:::::::::::::::::c      tt::::::::::::::ti::::::i
     CCC::::::::::::C a::::::::::aa:::a cc:::::::::::::::c        tt:::::::::::tti::::::i
        CCCCCCCCCCCCC  aaaaaaaaaa  aaaa   cccccccccccccccc          ttttttttttt  iiiiiiii
EOF
  echo -n "${reset}"
  echo "Welcome to the Kevin's Cacti script!"
  echo
}
welcomeMessage

if [[ `whoami` == "root" ]]; then
    printerror "You ran me as root! Do not run me as root!"
    exit 1
elif grep -q "Raspbian GNU/Linux 9" /etc/os-release; then
	if [[ `whoami` != "pi" ]]; then
		printerror "Uh-oh. You are not logged in as the default pi user. Exiting..."
		exit 1
	else
		os_dist=raspbian
		os_name=Raspbian
		webserver=apache2
		verphp="$(php -v | grep -Po '(?<=PHP )([0-7.]+)' | cut -c-3)"
	fi
elif grep -q "Raspbian GNU/Linux 10" /etc/os-release; then
	if [[ `whoami` != "pi" ]]; then
		printerror "Uh-oh. You are not logged in as the default pi user. Exiting..."
		exit 1
	else
		os_dist=raspbian
		os_name=Raspbian
		webserver=apache2
		verphp="$(php -v | grep -Po '(?<=PHP )([0-7.]+)' | cut -c-3)"
	fi
elif grep -q "CentOS Linux 7" /etc/os-release; then
	if [[ `whoami` != "cacti" ]]; then
		printerror "Uh-oh. You are not logged in as the default cacti user. Exiting..."
		exit 1
	else
		os_dist=centos
		os_name=CentOS7
		webserver=httpd
	fi
elif grep -q "CentOS Linux 8" /etc/os-release; then
	if [[ `whoami` != "cacti" ]]; then
		printerror "Uh-oh. You are not logged in as the default cacti user. Exiting..."
		exit 1
	else
		os_dist=centos
		os_name=CentOS8
		webserver=httpd
	fi	
else
	printerror "We don't appear to be on a supported OS. Exiting..."
	exit 1
fi

if [[ $1 == "dev" ]]; then
	param1=$1
	param2=$2
	branch=dev
	printwarn "Now on DEV script."
	if [[ $2 == "develop" ]]; then
		prod_version=$( curl -s https://raw.githubusercontent.com/Cacti/cacti/develop/include/cacti_version )
		printwarn "Switching to DEVELOP version v$prod_version via git..."
	fi
else
	branch=master
fi

# get the Cacti version
# get ready for dynamic update
#prod_version=( curl -s https://raw.githubusercontent.com/Cacti/cacti/master/include/cacti_version )
prod_version=1.2.14
test -f /var/www/html/cacti/include/cacti_version
if [ $? -ne 1 ];then
	printerror "Cacti is already installed, cannot proceed..."
	exit 1
fi
if [[ $1 == "develop" ]]; then
	prod_version=( curl -s https://raw.githubusercontent.com/Cacti/cacti/develop/include/cacti_version )
fi

printinfo "This script installs all prerequisites and sets up Cacti v$prod_version."
printwarn "This ONLY works on a brand new clean install of $os_name without any changes or updates."
printwarn "Use only at your own risk!"

installask () {
	echo -e "\033[32m"
	read -p "Are you REALLY sure you want to install? y/N: " yn
	echo -e -n "\033[0m"
	case "$yn" in
	y | Y | yes | YES| Yes ) printinfo "Ok, let's go!"
	;;
	* ) 
		printwarn "Thanks for considering, exiting now..."
		exit 1
	;;
	esac
}
installask

installSpine() {
printinfo "Setting up Spine..."
# spine
wget -q https://www.cacti.net/downloads/spine/cacti-spine-$prod_version.tar.gz
			if [ $? -ne 0 ];then
				printerror "downloading Spine, you will need to use cmd.php..."
			else
				tar xzf cacti-spine-$prod_version.tar.gz
				if [ $? -ne 0 ];then
					printerror "unpacking Spine, you will need to use cmd.php..."
				fi
				rm cacti-spine-$prod_version.tar.gz
				cd cacti-spine-$prod_version
				./bootstrap
				if [ $? -ne 0 ];then
					printerror "bootstrapping Spine, you will need to use cmd.php..."
				fi
				./configure
				if [ $? -ne 0 ];then
					printerror "configuring Spine, you will need to use cmd.php..."
				fi
				make
				if [ $? -ne 0 ];then
					printerror "making Spine, you will need to use cmd.php..."
				fi
				sudo make install
				if [ $? -ne 0 ];then
					printerror "installing Spine, you will need to use cmd.php..."
				fi
				sudo chown root:root /usr/local/spine/bin/spine && sudo chmod +s /usr/local/spine/bin/spine
				sudo mv /usr/local/spine/etc/spine.conf.dist /usr/local/spine/etc/spine.conf
				sudo sed -i 's/cactiuser/cacti/g' /usr/local/spine/etc/spine.conf
				cd
				rm -rf cacti-spine-$prod_version
			fi
}

printinfo "Welcome to Kevin's CentOS7/8/RaspberryPi Cacti install script!"

printwarn "Updating $os_name, this may take a while..."
if [[ $os_dist == "raspbian" ]]; then
	sudo apt -y -qq update; sudo apt -y -qq upgrade
	if [ $? -ne 0 ];then
		printerror "Something went wrong updating Raspbian, exiting..."
		exit 1
	fi
elif [[ $os_dist == "centos" ]]; then
	sudo yum -y -q update; sudo yum -y -q upgrade
	if [ $? -ne 0 ];then
		printerror "Something went wrong updating CentOS, exiting..."
		exit 1
	fi
else
    printerror "Uh-oh. We don't appear to be on a supported OS. Exiting..."
    exit 1
fi

printwarn "Installing prerequisites, this may take a while too..."
case $os_name in 
	Raspbian)
		sudo apt -y -qq install autoconf dos2unix unattended-upgrades php libapache2-mod-php php-mbstring php-gmp mariadb-server mariadb-client php-mysql php-curl php-net-socket php-gd php-intl php-pear php-imap php-memcache php-pspell php-recode php-tidy php-xmlrpc php-snmp php-mbstring php-gettext php-gmp php-json php-xml php-common snmp snmpd snmp-mibs-downloader rrdtool php-ldap php-snmp sendmail gcc libssl-dev libmariadbclient-dev libperl-dev libsnmp-dev help2man default-libmysqlclient-dev git
		if [ $? -ne 0 ];then
			printerror "Something went wrong installing prerequisites, exiting..."
			exit 1
		else
			printinfo "Enabling webserver and mysql server..."
			sudo systemctl start apache2 && sudo systemctl enable apache2 && sudo systemctl start mariadb && sudo systemctl enable mariadb
		fi
	;;
	CentOS7)
		curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
		sudo sed -i 's/enforcing/permissive/g' /etc/selinux/config
		sudo yum install -y -q httpd php php-mysqlnd MariaDB-server MariaDB-shared rrdtool net-snmp net-snmp-utils autoconf automake libtool dos2unix help2man openssl-devel MariaDB-devel net-snmp-devel nano wget git php-gd php-mbstring php-snmp php-ldap php-posix
		if [ $? -ne 0 ];then
			printerror "Something went wrong installing prerequisites, exiting..."
			exit 1
		else
			printinfo "Enabling webserver and mysql server..."
			sudo systemctl start httpd && sudo systemctl enable httpd && sudo systemctl start mariadb && sudo systemctl enable mariadb
		fi	
	;;
	CentOS8)
		curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
		sudo sed -i 's/enforcing/permissive/g' /etc/selinux/config
		printinfo "Setting up packages"
		sudo yum install -y -q make httpd php php-mysqlnd MariaDB-server MariaDB-shared rrdtool net-snmp net-snmp-utils autoconf automake libtool dos2unix openssl-devel MariaDB-devel net-snmp-devel nano wget git php-gd php-mbstring php-snmp php-ldap php-posix php-json php-simplexml php-gmp
		if [ $? -ne 0 ];then
			printerror "Something went wrong installing prerequisites, exiting..."
			exit 1
		else
			printinfo "Enabling webserver and mysql server..."
			sudo systemctl start httpd && sudo systemctl enable httpd && sudo systemctl start mariadb && sudo systemctl enable mariadb
			printinfo "Setting up help2man"
			sudo dnf --enablerepo=PowerTools install -y help2man || sudo dnf --enablerepo=powertools install -y help2man
		fi	
	;;
esac

if [[ $os_dist == "raspbian" ]]; then
	printinfo "Setting up Cacti user, get ready to enter a password!!"
	sudo adduser cacti 
	if [ $? -ne 0 ];then
		printerror "Something went wrong setting up Cacti user, exiting..."
		exit 1
	else
		sudo usermod -aG sudo cacti && sudo usermod -aG www-data cacti
		if [ $? -ne 0 ];then
			printerror "Something went wrong adding Cacti user groups, exiting..."
			exit 1
		fi
	fi
elif [[ $os_dist == "centos" ]]; then
	printinfo "Checking Cacti user groups..."
	groups | grep -q wheel
	if [ $? -ne 0 ];then
		printerror "Cacti is not in the suoders group, cannot proceed..."
		exit 1
	else
		sudo usermod -a -G apache cacti
		if [ $? -ne 0 ];then
			printerror "Something went wrong adding Cacti user to apache group, exiting..."
			exit 1
		fi
	fi
fi

func_dbask () {
          printinfo "Enter 1 to use an untouched Cacti DB or 2 to use Kevin's tweaked DB: "
	  read -n 1 -p "1/2: " db
        if [ "$db" = "1" ]; then
		printinfo "Setting up default db..."
		curl -s https://raw.githubusercontent.com/Cacti/cacti/master/cacti.sql | sudo mysql cacti
		#sudo mysql cacti < /var/www/html/cacti/cacti.sql
		if [ $? -ne 0 ];then
			printerror "Something went wrong importing Cacti database, exiting..."
			exit 1
		else
		printinfo "Imported Cacti db. The default username/password is admin and admin."
		counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=db-cacti&write=0 )
		printwarn "This script sets up 1m polling. When finishing install in the Web UI, be sure to select 1m polling and 1m cron"
		fi
	elif [ "$db" = "2" ]; then
		printinfo
		printinfo "Importing Kevin's tweaked db..."
		curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/install/mysql.cacti_clean.sql | sudo mysql cacti
		if [ $? -ne 0 ];then
			printerror "Something went wrong importing Cacti database, exiting..."
			exit 1
		else
		printinfo "The default username/password is admin and Cactipw1! (including the exclamation)."
		counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=db-kevin&write=0 )
		fi
	else
		printwarn "Not a valid selection, please try again..."
		func_dbask
	fi
}

printinfo "Setting up Cacti database"
sudo mysql -u root -e "create database cacti";
if [ $? -ne 0 ];then
	printerror "Something went wrong setting up Cacti database, exiting..."
	exit 1
fi
func_dbask
	sudo mysql -e "GRANT ALL PRIVILEGES ON cacti.* TO cacti@localhost IDENTIFIED BY 'cacti'";
	sudo mysql -e "GRANT SELECT ON mysql.time_zone_name TO 'cacti'@'localhost'";
	sudo mysql -e "flush privileges";

printinfo "Setting up MYSQL timezone entires..."
mysql_tzinfo_to_sql /usr/share/zoneinfo | sudo mysql mysql
if [ $? -ne 0 ];then
	printerror "Something went wrong importing timezone data, exiting..."
	exit 1
fi

printinfo "Enabling local SNMP"
if [[ $os_dist == "raspbian" ]]; then
	sudo sed -i 's/#mibs/mibs/g' /etc/snmp/snmp.conf
	if [ $? -ne 0 ];then
		printerror "Something went wrong enabling SNMP, exiting..."
		exit 1
	else
	sudo systemctl start snmpd && sudo systemctl enable snmpd
		if [ $? -ne 0 ];then
			printerror "Something went wrong enabling SNMP, exiting..."
			exit 1
		fi
	fi
elif [[ $os_dist == "centos" ]]; then
	sudo sed -i 's/OPTIONS="-LS0-6d"/OPTIONS="-Ls3d"/g' /etc/sysconfig/snmpd
	sudo systemctl start snmpd && sudo systemctl enable snmpd
	if [ $? -ne 0 ];then
		printerror "Something went wrong enabling SNMP, exiting..."
		exit 1
	fi
fi

printinfo "Updating mysql for Cacti v1.2.x"
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
		printerror "Something went wrong restarting mysql, exiting..."
		exit 1
		fi
else
	printinfo "my.cnf already has mysqld entry"
fi

printinfo "Setting up Cacti"
wget -q https://github.com/Cacti/cacti/archive/release/$prod_version.tar.gz
if [ $? -ne 0 ];then
	printerror "Something went wrong downloading Cacti, exiting..."
	exit 1
else
	tar xzf $prod_version.tar.gz
	rm  $prod_version.tar.gz
	sudo mv cacti-release-$prod_version/ /var/www/html/cacti
	touch /var/www/html/cacti/log/cacti.log
	mv /var/www/html/cacti/include/config.php.dist /var/www/html/cacti/include/config.php
	sudo sed -i 's/cactiuser/cacti/g' /var/www/html/cacti/include/config.php
	if [[ $1 == "dev" ]]; then
		printinfo	
	else
		counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=cacti-install-$prod_version&write=0 )
		touch ~/.install
		printinfo
		counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=cacti-install-$os_dist&write=0 )
		printinfo
	fi
fi

# fixup permissions
bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/update-permissions.sh)

function update-php () {
printinfo "Updating php settings for cacti v1.2.x..."
if [[ $os_dist == "raspbian" ]]; then
	phpini_path=/etc/php/$verphp/apache2/php.ini
	phpcliini_path=/etc/php/$verphp/cli/php.ini
elif [[ $os_dist == "centos" ]]; then
	phpini_path=/etc/php.ini
	printinfo "Allowing http/s access through firewall..."
	sudo firewall-cmd --add-service=http --permanent && sudo firewall-cmd --add-service=https --permanent
	sudo systemctl restart firewalld
fi
grep -q -w "memory_limit = 128M" $phpini_path
	if [ $? -ne 0 ];then
		grep -q -w "memory_limit = 400M" $phpini_path
		if [ $? -ne 0 ];then
			printwarn "php memory_limit neither 128 or 800, cannot update..."
		else
			printinfo "php memory_limit already = 400."
		fi
	else
		sudo sed -i 's/memory_limit = 128M/memory_limit = 800M/g' $phpini_path
		if [ $? -ne 0 ];then
			printwarn "php memory_limit NOT updated."
		else
			printinfo "php memory_limit updated to 800."
		fi
	fi
grep -q -w "max_execution_time = 30" $phpini_path
	if [ $? -ne 0 ];then
		#NOT 128, check for 800
		grep -q -w "max_execution_time = 60" $phpini_path
		if [ $? -ne 0 ];then
			printwarn "php max_execution_time neither 30 or 60, cannot update..."
		else
			printinfo "php max_execution_time already = 60."
		fi
	else
		sudo sed -i 's/max_execution_time = 30/max_execution_time = 60/g' $phpini_path
				if [ $? -ne 0 ];then
					printwarn "php max_execution_time NOT updated."
				else
					printinfo "php max_execution_time updated to 60."
				fi
	fi

grep -q -w ";date.timezone =" $phpini_path
if [ $? -ne 0 ];then
	grep -q -w "max_execution_time = 60" $phpini_path
	if [ $? -ne 0 ];then
		printwarn "php max_execution_time neither 30 or 60, cannot update..."
	else
		printinfo "php max_execution_time already = 60."
	fi
else
	printinfo "Updating Timezone settings to America/Los_Angeles."
	sudo timedatectl set-timezone America/Los_Angeles
	sudo sed -i 's/;date.timezone =/date.timezone="America\/Los_Angeles"/g' $phpini_path
	sudo sed -i 's/;date.timezone =/date.timezone="America\/Los_Angeles"/g' $phpcliini_path
	printwarn "If you are not in America/Los_Angeles you will need to manually change the timezone using
	'sudo timedatectl set-timezone Your/Zone'
	and
	'sudo sed -i 's/;date.timezone =/date.timezone="Your\/Zone"/g' $phpini_path'
	'sudo sed -i 's/;date.timezone =/date.timezone="Your\/Zone"/g' $phpcliini_path'
	"
fi

printinfo "Updating Apache Settings for Cacti 1.2.x"
sudo systemctl restart $webserver
}
update-php

installSpine

printinfo "Setting up Plugins..."
# plugins
cd /var/www/html/cacti/plugins
sudo -u cacti git clone https://github.com/Cacti/plugin_thold.git thold
sudo -u cacti git clone https://github.com/Cacti/plugin_monitor.git monitor
sudo -u cacti git clone https://github.com/Cacti/plugin_webseer.git webseer

printinfo "Installing Cacti Crontab..."
cd
echo "*/1 * * * *     /usr/bin/php -q /var/www/html/cacti/poller.php --force" > mycron
sudo crontab -u cacti mycron
	if [ $? -ne 0 ];then
		printwarn "ERROR setting up Cacti crontab entry, Cacti poller will not run."
	else
		rm mycron
	fi

printinfo "Installing Cacti upgrade script for future use at ~/cacti-upgrade.sh..."
sudo -u cacti wget -q -P ~/ https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/cacti-upgrade.sh
sudo chmod +x ~/cacti-upgrade.sh

func_smokeask () {
          echo -e "\033[32m"
	  read -n 1 -p "Would you like to install SmokePing? y/n: " smokeinstall
        if [ "$smokeinstall" = "y" ]; then
		bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/install/smokeping/install-smokeping.sh)
	elif [ "$smokeinstall" = "n" ]; then
		printinfo
		printinfo "Thanks for considering, going back..."
	else
		printwarn "Not a valid selection, please try again..."
		func_smokeask
	fi
}

func_reboot () {
	echo -e "\033[32m"
	read -n 1 -p "You must reboot to complete Cacti setup. Reboot now? y/n: " rebootnow
        if [ "$rebootnow" = "y" ]; then
	printinfo
	printwarn "Rebooting, see you soon!"
	sudo reboot
	elif [ "$rebootnow" = "n" ]; then
		printinfo
		printwarn "Don't forget to reboot or your graphs will not display propery. exiting..."
		exit 1
	else
		printwarn "Not a valid selection, please try again..."
		func_reboot
	fi
}

case $os_name in
	Raspbian)
		printinfo "If you want to install SmokePing check my install script at https://raw.githubusercontent.com/KnoAll/cacti-template/master/install/smokeping"
		printinfo "Be sure to check for Cacti updates. After login in as the Cacti user run ~./cacti-update.sh"
		printwarn "You must complete installation via web interface before doing an upgrade to the current version"
	;;
	CentOS8)
		func_smokeask
		printinfo "Be sure to check for Cacti updates. After login in as the Cacti user run ~./cacti-update.sh"
		printwarn "You must complete installation via web interface before doing an upgrade to the current version"
	;;
	*)
		func_smokeask
		printinfo "Be sure to check for Cacti updates. After login in as the Cacti user run ~./cacti-update.sh"
		printwarn "You must complete installation via web interface before doing an upgrade to the current version"
	;;
esac

printinfo "Cacti v$prod_version insatlled, all Done!"


func_reboot
