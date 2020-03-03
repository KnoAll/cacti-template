#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/upgrade-cacti.sh)
green=$(tput setaf 2)
red=$(tput setaf 1)
tan=$(tput setaf 3)
reset=$(tput sgr0)
errorcount=0
branch=master

printinfo() {
	printf "${tan}::: ${green}%s${reset}\n" "$@"
}
printwarn() {
	printf "${tan}*** WARNING: %s${reset}\n" "$@"
}
printerror() {
	printf "${red}!!! ERROR: %s${reset}\n" "$@"
}
case $(whoami) in
        root)
		printerror "You ran me as root! Do not run me as root!"
		exit 1
		;;
        pi)
		printerror "You ran me as pi user! Do not run me as pi!"
		exit 1
                ;;
        cacti)
                ;;
        *)
		printerror "Uh-oh. You are not logged in as the cacti user. Exiting..."
		exit 1
                ;;
esac

# get the Cacti version
upgrade_version=1.1.6
# get ready for dynamic update
#prod_version=$( curl -s https://raw.githubusercontent.com/Cacti/cacti/master/include/cacti_version )
prod_version=1.2.10
symlink_cactidir=1.1.28
cactiver=$( cat /var/www/html/cacti/include/cacti_version )
if [[ -z $cactiver ]];then
	printerror "Cacti is either not installed or we were not able to determine it's version. Cannot proceed..."
	exit 1
fi
if [[ $1 == "dev" || $1 == "--switch-dev" ]]; then
	param1=$1
	param2=$2
	branch=dev
	printwarn "Now on DEV branch."
	if [[ $2 == "develop" ]]; then
		prod_version=$( curl -s https://raw.githubusercontent.com/Cacti/cacti/develop/include/cacti_version )
		printwarn "Switching to DEVELOP version v$prod_version via git..."
	fi
else
	counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=cacti-upgrade&write=0 )
	printinfo
	branch=master
fi

# get latest version of cacti-upgrade
if grep -q v1.2.8 cacti-upgrade.sh; then
	printinfo ""
else
	printinfo "Upgrading cacti.upgrade.sh"
	rm cacti-upgrade.sh
	wget -q https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/cacti-upgrade.sh
	chmod +x cacti-upgrade.sh
fi

file="~/template"
if [ -e "$file" ]
then
	counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=template-$cactiver&write=0 )
	printinfo
	rm $file
else
	printinfo
fi

file="~/.install"
if [ -e "$file" ]
then
	counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=install-$cactiver&write=0 )
	printinfo
	rm $file
else
	printinfo
fi

if which yum >/dev/null; then
	pkg_mgr=yum
	os_dist=centos
elif which apt >/dev/null; then
	pkg_mgr=apt
	os_dist=raspbian
else
		printerror "You seem to be on something other than CentOS or Raspian, cannot proceed..."
		exit 1
fi

function version_ge() { test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" == "$1"; }
function version_lt() { test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" != "$1"; }

function check-smokeping () {
	test -e /opt/smokeping/bin/smokeping
	if [ $? -ne 0 ];then
		smokever=nosmoke
		printinfo
	else
		bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/upgrade-smokeping.sh) $branch
		smokeping_onoff
	fi
}

function smokeping_onoff () {
if [[ $smokever == "nosmoke" ]]; then
	printinfo
else
	systemctl -q is-enabled smokeping.service
	if [ $? -ne 0 ];then
		# smokeping not enabled
		printinfo "Smokeping service is disabled, do you wish to enable?"
		read -n 1 -p "y/n: " smokeon
        		if [ "$smokeon" = "y" ]; then
				printinfo "Enabling Smokeping service..."
				sudo systemctl enable smokeping.service
				sudo systemctl start smokeping.service
			else
				printinfo "OK, no Smokeping today, bye!"
			fi
	else
		# smokeping enabled
		printinfo "Smokeping service is enabled and running at http://localhost/smokeping/smokeping.cgi, do you wish to disable?"
		read -n 1 -p "y/n: " smokeoff
			if [ "$smokeoff" = "y" ]; then
				printinfo "Disabling Smokeping service..."
				sudo systemctl disable smokeping.service
				sudo systemctl stop smokeping.service
			else
				printinfo "OK, leaving Smokeping enabled, you should check it out!"
			fi
	fi
fi	
}

function upgrade-plugins() {
	printinfo "Would you like to check your cacti plugins for updates?"
	read -n 1 -p "y/n: " plugup
        	if [ "$plugup" = "y" ]; then
			printinfo
			bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/upgrade-plugins.sh) $branch
		else
			printinfo "OK, no plug-up today..."
		fi
}

if version_ge $cactiver $upgrade_version; then
        if version_ge $cactiver $prod_version; then
                printinfo "Cacti v$cactiver is up to date with production v$prod_version, nothing to do!"
		counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=$cactiver-current&write=0 )
		printinfo
		upgrade-plugins
		check-smokeping
		printinfo "All done!"
                exit 0
        else
		printinfo "Found compatible Cacti v$cactiver install, upgrading to v$prod_version..."
        fi
else
	printerror "Cacti v$cactiver is less than upgrade version v$upgrade_version cannot install, exiting..."
	exit 1
fi

printinfo "Welcome to Kevin's Cacti Template upgrade script!"
sudo printinfo

function update-php () {
if version_ge $prod_version 1.2.0; then
	if version_ge $cactiver 1.2.0; then
		printinfo
	else
		printinfo "Updating php settings for cacti v1.2.x..."
		if [[ $pkg_mgr == "yum" ]]; then
			phpini_path=/etc/php.ini
			webserver=httpd
		else
			phpini_path=/etc/php/7.0/apache2/php.ini
			phpclini_path=/etc/php/7.0/cli/php.ini
			webserver=apache2
		fi
		grep -q -w "memory_limit = 128M" $phpini_path
		if [ $? -ne 0 ];then
			grep -q -w "memory_limit = 800M" $phpini_path
			if [ $? -ne 0 ];then
				printwarn "php memory_limit neither 128 or 800, cannot update..."
			else
				printinfo "php memory_limit already = 800."
			fi
		else
			sudo sed -i 's/memory_limit = 128M/memory_limit = 800M/g' $phpini_path
			if [ $? -ne 0 ];then
				printerror "php memory_limit NOT updated."
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
		sudo systemctl restart $webserver.service
	fi
fi
}

function update-mysqld () {
if [[ $pkg_mgr == "yum" ]]; then
	mycnf_path=/etc/my.cnf
else
	mycnf_path=/etc/mysql/my.cnf
fi
if version_ge $prod_version 1.2.0; then
	if version_ge $cactiver 1.2.0; then
		printinfo
	else
		printinfo "updating mysqld settings for cacti v1.2.x..."
		grep -q -w "mysqld" $mycnf_path
		if [ $? -ne 0 ]; then
			#Fugly but works for now...
			sudo sed  -i '$ a [mysqld]' $mycnf_path
			sudo sed  -i '$ a max_allowed_packet=16M' $mycnf_path
			sudo sed  -i '$ a innodb_additional_mem_pool_size=80M' $mycnf_path 
			sudo sed  -i '$ a innodb_flush_log_at_timeout=3' $mycnf_path 
			sudo sed  -i '$ a innodb_read_io_threads=32' $mycnf_path
			sudo sed  -i '$ a innodb_write_io_threads=16' $mycnf_path 
			sudo sed  -i '$ a max_heap_table_size=30M' $mycnf_path 
			sudo sed  -i '$ a tmp_table_size=30M' $mycnf_path 
			sudo sed  -i '$ a join_buffer_size=58M' $mycnf_path 
			sudo sed  -i '$ a innodb_buffer_pool_size=450M' $mycnf_path 
			sudo sed  -i '$ a character-set-server=utf8mb4' $mycnf_path 
			sudo sed  -i '$ a collation-server=utf8mb4_unicode_ci' $mycnf_path 
			sudo sed  -i '$ a max_allowed_packet=16M' $mycnf_path
			sudo sed  -i '$ a innodb_file_format=Barracuda' $mycnf_path
		fi
	sudo systemctl restart mysqld.service
	fi
fi

#Update mysql for large_prefix
grep -q -w "innodb_large_prefix" $mycnf_path
	if [ $? -ne 0 ];then
		sudo sed  -i '$ a innodb_large_prefix=1' $mycnf_path
		sudo systemctl restart mysqld.service
	else
		printinfo
	fi
#Barracuda file format update
grep -q -w "innodb_file_format" $mycnf_path
if [ $? -ne 0 ];then
		sudo sed  -i '$ a innodb_file_format=Barracuda' $mycnf_path
		sudo systemctl restart mysqld.service
	else
		printinfo
	fi

mysql -u root -pcacti cacti -s -e "ALTER DATABASE cacti CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci;"

}

function backup-db () {
printinfo "Backing up DB..."
mysqldump --user=cacti --password=cacti -l --add-drop-table cacti |gzip > /var/www/html/cacti/mysql.cacti_$(date +\%Y\%m\%d).sql.gz
printinfo
}

function check-permissions () {
touch /var/www/html/perm
if [ $? -ne 0 ];then
	printwarn "File permissions not sufficient, attempting to repair..."
	update-permissions
else
	rm /var/www/html/perm
	printinfo
fi
}

function check-prerequisites () {
	printinfo
}

function upgrade-cacti () {
printinfo "Beginning Cacti upgrade..."
cd /var/www/html/
if [[ $1 == "develop" ]]; then
	printinfo "Cloning from Git..."
	mv cacti/ cacti_$cactiver/
	git clone https://github.com/Cacti/cacti.git
	if [ $? -ne 0 ]; then
		printerror "Git clone error, exiting..."
		exit 1
	else
		git checkout $1
	fi
else
	wget -q https://github.com/Cacti/cacti/archive/release/$prod_version.tar.gz
	if [ $? -ne 0 ];then
			printerror "Cacti download error cannot install, exiting..."
			exit 1
	else
		tar -xzf $prod_version.tar.gz
		if [ $? -ne 0 ];then
			printerror "Cacti unpack error cannot install, exiting..."
			exit 1
		else
			sudo $pkg_mgr install -y -q php-gmp sendmail
			mv cacti/ cacti_$cactiver/
			rm $prod_version.tar.gz
			mv cacti-release-$prod_version cacti
		fi
	fi
fi
cp -a cacti_$cactiver/rra/* cacti/rra/
cp -a cacti_$cactiver/scripts/* cacti/scripts/
cp -a cacti_$cactiver/resource/* cacti/resource/
cp -a cacti_$cactiver/plugins/* cacti/plugins/
update-config
update-permissions
printinfo
}

function update-config () {
printinfo "Updating cacti config..."
cd /var/www/html/
if [ -f  cacti/include/config.php ];
then
	sed -i 's/cactiuser/cacti/g' cacti/include/config.php
else
	mv cacti/include/config.php.dist cacti/include/config.php
	sed -i 's/cactiuser/cacti/g' cacti/include/config.php
fi
}

function update-permissions () {
	bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/update-permissions.sh)
}

function upgrade-spine () {
printinfo "Upgrading spine..."
cd
if [[ $1 == "develop" ]]; then
	printinfo "Cloning from Git..."
	git clone https://github.com/Cacti/spine.git
	cd spine
	git checkout $1
	printinfo "Bootstrapping spine..."
	./bootstrap
else
	wget -q https://www.cacti.net/downloads/spine/cacti-spine-$prod_version.tar.gz
	if [ $? -ne 0 ];then
			printerror "Spine download error cannot install, exiting. You will need to manually upgrade Spine."
			exit 1
	else
		tar -xzf cacti-spine-*.tar.gz
		rm cacti-spine-*.tar.gz
		cd cacti-spine-*
	fi
fi
if [[ $pkg_mgr == "yum" ]]; then
	sudo $pgk_mgr install -y -q gcc glibc glibc-common gd gd-devel
else
	sudo $pkg_mgr install -y -qq gcc glibc-doc build-essential gdb autoconf
fi
./bootstrap
./configure
make 
sudo make install
cd /usr/local/spine/bin
sudo chown root:root spine
sudo chmod +s spine
printinfo
cd
rm -rf *spine*
}

function compress-delete () {
	printinfo "Do you want to archive the original cacti directory?"
	read -n 1 -p "y/n: " cleanup
        if [ "$cleanup" = "y" ]; then
		printinfo
		printinfo "Creating compressed archive..."
		tar -pczf ~/backup_cacti-$cactiver.tar.gz -C /var/www/html/ cacti_$cactiver
		if [ $? -ne 0 ];then
			printwarn "Archive creation failed."
		else
			rm -rf /var/www/html/cacti_$cactiver
			printinfo "Archive created in home directory ~/backup_cacti-$cactiver.tar.gz..."
		fi
        elif [ "$cleanup" = "n" ]; then
		printinfo
        else
		printwarn "You have entered an invallid selection!"
		printinfo "Please try again!"
            clear
	fi
}

function update-cactidir () {
if version_lt $cactiver $symlink_cactidir; then
	printinfo "Legacy cacti install directory found, updating..."
	rm /var/www/html/cacti
	if [ $? -ne 0 ];then
		printerror "Cacti directory update failed, exiting."
		exit 1
	else
	mv /var/www/html/cacti-$cactiver /var/www/html/cacti
	fi
fi
}

#upgrade-git
check-permissions
backup-db
update-cactidir
upgrade-cacti $2
update-php
update-mysqld
upgrade-spine $2
compress-delete
if [[ $1 == "dev" ]]; then
	printinfo
else
	counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=cacti-$cactiver-$prod_version&write=0 )
	printinfo
	counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=cacti-$os_dist&write=0 )
	printinfo	
fi
upgrade-plugins
check-smokeping
update-permissions

printinfo "Cacti upgraded to v$prod_version. Proceed to the web interface to complete upgrade..."
printinfo "For script errors or troubleshooting please check the Github page at https://github.com/KnoAll/cacti-template. "
exit 0
