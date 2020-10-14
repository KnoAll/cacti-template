#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/upgrade-mysql.sh) dev

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

if [[ $1 == "dev" || $1 == "--switch-dev" ]]; then
	param1=$1
	param2=$2
	branch=dev
	printwarn "Now on DEV MYSQL branch."
else
	printinfo
	branch=master
fi

printinfo "Checking for MariaDB upgrade..."
printinfo
if [[ `whoami` == "root" ]]; then
    printerror "You ran me as root! Do not run me as root!"
    exit 1
elif grep -q "Raspbian GNU/Linux 9" /etc/os-release; then
  printerror "Sorry, Raspbian not supported for PHP upgrade yet, cannot proceed..."
  printinfo
  exit 1
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
  printerror "Sorry, Raspbian not supported for PHP upgrade yet, cannot proceed..."
  printinfo
  exit 1
	if [[ `whoami` != "pi" ]]; then
		printerror "Uh-oh. You are not logged in as the default pi user. Exiting..."
		printinfo
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
		printinfo
		exit 1
	else
		os_dist=centos
		os_name=CentOS7
		webserver=httpd
		pkg_mgr=yum
		os_dist=centos
		remi=remi-release-7.rpm
	fi
elif grep -q "CentOS Linux 8" /etc/os-release; then
  printerror "Sorry, CentOS8 not supported for MYSQL upgrade yet, cannot proceed..."
  printinfo
  exit 1
	if [[ `whoami` != "cacti" ]]; then
		printerror "Uh-oh. You are not logged in as the default Cacti user. Exiting..."
		printinfo
		exit 1
	else
		os_dist=centos
		os_name=CentOS8
		webserver=httpd
		pkg_mgr=yum
		os_dist=centos
		remi=remi-release-8.rpm
	fi	
else
	printerror "We don't appear to be on a supported OS. Exiting..."
	printinfo
	exit 1
fi

#installed MYSQL version
mysql_ver=$( mysql -u root -pcacti -N -B -e "select version();" )
	if [ $? -ne 0 ];then
		printerror "ERROR determining MariaDB version, cannot continue."
		counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=upgrade-mysql-error&write=0 )
		exit 1
	fi

upgrade_version=$( curl -s https://raw.githubusercontent.com/Cacti/cacti/master/include/cacti_version )
cacti_ver=$( cat /var/www/html/cacti/include/cacti_version )
shmysql_ver=$(echo $mysql_ver | cut -c-4)
#set upgrade version
mysql_version=10.5
mysql_description="v10.5.x"

function version { echo "$@" | gawk -F. '{ printf("%03d%03d%03d\n", $1,$2,$3); }'; }

checkCacti() {
	if [ "$(version "$cacti_ver")" -gt "$(version "$upgrade_version")" ]; then
		printinfo
	else
		printerror "Installed Cacti v$cacti_ver <= minimum required Cacti v$upgrade_version, you must upgrade Cacti. Cannot upgrade MariaDB."
		exit 1
	fi
}

upgradeAsk () {
	#check version of MYSQL installed
	if [ "$(version "$mysql_version")" -gt "$(version "$shmysql_ver")" ]; then
		printinfo
		read -p "You are running MariaDB v$shmysql_ver.x. Do you want to upgrade your MariaDB install to $mysql_description? y/N: " upAsk
		case "$upAsk" in
		y | Y | yes | YES| Yes ) printinfo "Ok, let's go!"
			if [[ $param1 == "dev" ]]; then
				printwarn $param1
			else
				counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=upgrade-mysql_$shmysql_ver&write=0 )
				counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=upgrade-mysql&write=0 )
			fi
			upgradeMYSQL
		;;
		* ) 
			printwarn "OK, please consider upgrading, old versions of MariaDB are not updated and may contain known security and stability issues."
			if [[ $param1 == "dev" ]]; then
				printwarn $param1
			else
				counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=decline-upgrade-mysql&write=0 )
			fi
			exit 1
		;;
		esac
	else
		printinfo "Installed MariaDB $mysql_ver >= current stable $mysql_description. Nothing to do."
		exit 0
	fi
}

upgradeMYSQL() {
		printinfo "Setting up MariaDB repo"
		sudo yum -y -q update
		cd /etc/yum.repos.d
		sudo mv MariaDB.repo MariaDB.repo.$shmysql_ver
		sudo wget -q https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/install/MariaDB.repo
		printinfo "Enabling new $mysql_description"
		sudo systemctl stop mariadb
		sudo sed -i 's/innodb_additional_mem_pool/#innodb_additional_mem_pool/g' /etc/my.cnf
		sudo yum remove -y -q MariaDB-server MariaDB-shared MariaDB-client MariaDB-common MariaDB-devel
		sudo yum install -y -q MariaDB-server MariaDB-shared MariaDB-client MariaDB-common MariaDB-devel net-snmp php-mysql
		sudo cp /etc/snmp/snmpd.conf.rpmsave /etc/snmp/snmpd.conf
		sudo cp /etc/my.cnf.rpmsave /etc/my.cnf
		sudo systemctl enable snmpd
		sudo systemctl start snmpd
		sudo systemctl enable mariadb
		sudo systemctl start mariadb
		sudo mysql_upgrade --silent -u root -pcacti
		sudo systemctl restart httpd
		sudo yum -y -q update
			if [ $? -ne 0 ];then
				printerror "ERROR upgrading MariaDB version."
			else
				mysql_ver=$( mysql -u root -pcacti -N -B -e "select version();" )
				printinfo "MariaDB upgraded to $mysql_ver"
			fi

}

checkCacti
upgradeAsk

printinfo

exit 0
