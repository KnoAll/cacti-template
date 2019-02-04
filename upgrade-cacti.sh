#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/upgrade-cacti.sh)

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
if [[ $1 == "dev" ]]; then
	branch=dev
	echo -e "\033[31m Now on DEV script."
	echo -e -n "\033[0m"
elif [[ $1 == "develop" ]]; then
	branch=develop
else
	branch=master
fi

# get the Cacti version
upgrade_version=1.1.6
# get ready for dynamic update
#prod_version=$( curl -s https://raw.githubusercontent.com/Cacti/cacti/master/include/cacti_version )
prod_version=1.2.2
symlink_cactidir=1.1.28
cactiver=$( cat /var/www/html/cacti/include/cacti_version )
if [ $? -ne 0 ];then
	echo -e "\033[31m Cacti is either not installed or we were not able to determine it's version. Cannot proceed..."
	echo -e -n "\033[0m"
	exit 1
fi
if [[ $branch == "develop" ]]; then
	prod_version=$( curl -s https://raw.githubusercontent.com/Cacti/cacti/develop/include/cacti_version )
	if [ $? -ne 0 ];then
		echo -e "\033[31m Switching to DEV version v$prod_version failed, cannot proceed..."
		echo -e -n "\033[0m"
		exit 1
	else
	    	echo -e "\033[31m Switching to DEV version v$prod_version..."
    		echo -e -n "\033[0m"
	fi
fi
if which yum >/dev/null; then
	pkg_mgr=yum
elif which apt >/dev/null; then
	pkg_mgr=apt
else
		echo -e "\033[31m You seem to be on something other than CentOS or Raspian, cannot proceed..."
		echo -e -n "\033[0m"
		exit 1
fi

function version_ge() { test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" == "$1"; }
function version_lt() { test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" != "$1"; }

function check-smokeping () {
	test -e /opt/smokeping/bin/smokeping
	if [ $? -ne 0 ];then
		smokever=nosmoke
		echo ""
	else
		bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/upgrade-smokeping.sh) $branch
		smokeping_onoff
	fi
}

function smokeping_onoff () {
if [[ $smokever == "nosmoke" ]]; then
	echo ""
else
	systemctl -q is-enabled smokeping.service
	if [ $? -ne 0 ];then
		# smokeping not enabled
		echo -e "\033[32m Smokeping service is disabled, do you wish to enable?"
		echo -e -n "\033[0m"
		read -n 1 -p "y/n: " smokeon
        		if [ "$smokeon" = "y" ]; then
				echo ""
				echo -e "\033[32m Enabling Smokeping service..."
				echo -e -n "\033[0m"
				sudo systemctl enable smokeping.service
				sudo systemctl start smokeping.service
			else
				echo ""
				echo -e "\033[32m OK, no Smokeping today, bye!"
				echo -e -n "\033[0m"
			fi
	else
		# smokeping enabled
		echo -e "\033[32m Smokeping service is enabled and running at http://localhost/smokeping/smokeping.cgi, do you wish to disable?"
		echo -e -n "\033[0m"
		read -n 1 -p "y/n: " smokeoff
			if [ "$smokeoff" = "y" ]; then
				echo ""
				echo -e "\033[32m Disabling Smokeping service..."
				echo -e -n "\033[0m"
				sudo systemctl disable smokeping.service
				sudo systemctl stop smokeping.service
			else
				echo ""
				echo -e "\033[32m OK, leaving Smokeping enabled, you should check it out!"
				echo -e -n "\033[0m"
			fi
	fi
fi	
}

function upgrade-plugins() {
	echo ""
	echo -e "\033[32m Would you like to check your cacti plugins for updates?"
	echo -e -n "\033[0m"
	read -n 1 -p "y/n: " plugup
        	if [ "$plugup" = "y" ]; then
			echo ""
			bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/upgrade-plugins.sh) $branch
		else
			echo ""
			echo -e "\033[32m OK, no plug-up today..."
			echo -e -n "\033[0m"
		fi
}

if version_ge $cactiver $upgrade_version; then
        if version_ge $cactiver $prod_version; then
                echo -e "\033[32m Cacti v$cactiver is up to date with production v$prod_version, nothing to do!"
		echo ""
		upgrade-plugins
		check-smokeping
		echo -e "\033[32m All done!"
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

function update-php () {
if version_ge $prod_version 1.2.0; then
	if version_ge $cactiver 1.2.0; then
		echo ""
	else
		echo -e "\033[32m Updating php settings for cacti v1.2.x..."
		echo -e -n "\033[0m"
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
				echo -e "\033[31m php memory_limit neither 128 or 800, cannot update..."
				echo -e -n "\033[0m"
			else
				echo -e "\033[32m php memory_limit already = 800."
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
		sudo systemctl restart $webserver.service
	fi
fi
}

function update-mysqld () {
if version_ge $prod_version 1.2.0; then
	if version_ge $cactiver 1.2.0; then
		echo ""
	else
		echo -e "\033[32m updating mysqld settings for cacti v1.2.x..."
	echo -e -n "\033[0m"
	if [[ $pkg_mgr == "yum" ]]; then
		mycnf_path=/etc/my.cnf
	else
		mycnf_path=/etc/mysql/my.cnf
	fi
		grep -q -w "mysqld" $mycnf_path
		if [ $? -ne 0 ];then
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
		else
			echo "put in other mysqld stuff here"
		fi
	sudo systemctl restart mysqld.service
	fi
fi
}

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
echo -e "\033[32m Beginning Cacti upgrade..."
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
		sudo $pkg_mgr install -y -q php-gmp sendmail
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

function update-config () {
echo -e "\033[32m Updating cacti config..."
echo -e -n "\033[0m"
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
echo -e "\033[32m Fixing file permissions..."
echo -e -n "\033[0m"
if [[ $pkg_mgr == "yum" ]]; then
	perm_grp=apache
else
	perm_grp=www-data
fi
groups | grep -q '\$permgrp\b'
if [ $? -ne 0 ];then
sudo usermod -a -G $perm_grp cacti
fi
sudo chgrp -R $perm_grp /var/www/html
sudo chown -R cacti /var/www/html
sudo find /var/www/html -type d -exec chmod g+rwx {} +
sudo find /var/www/html -type f -exec chmod g+rw {} +
sudo find /var/www/html -type d -exec chmod u+rwx {} +
sudo find /var/www/html -type f -exec chmod u+rw {} +
sudo find /var/www/html -type d -exec chmod g+s {} +
touch /var/www/html/cacti/log/cacti.log
chmod g+w /var/www/html/cacti/log/cacti.log
}

function upgrade-spine () {
echo -e "\033[32m Upgrading spine..."
echo -e -n "\033[0m"
cd
wget -q https://www.cacti.net/downloads/spine/cacti-spine-$prod_version.tar.gz
if [ $? -ne 0 ];then
                echo -e "\033[31m Spine download error cannot install..."
                echo -e -n "\033[0m"
else
	if [[ $pkg_mgr == "yum" ]]; then
		sudo $pgk_mgr install -y -q gcc glibc glibc-common gd gd-devel
	else
		sudo $pkg_mgr install -y -qq gcc glibc-doc build-essential gdb
	fi
	tar -xzf cacti-spine-*.tar.gz
	rm cacti-spine-*.tar.gz
	cd cacti-spine-*
	./configure
	make -s 
	sudo make install -s
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
		echo ""
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

#upgrade-git
check-permissions
backup-db
update-cactidir
upgrade-cacti
update-php
update-mysqld
upgrade-spine
compress-delete
upgrade-plugins
check-smokeping
update-permissions
echo -e "\033[32m Cacti upgraded to v$prod_version. Proceed to the web interface to complete upgrade..."
echo -e -n "\033[0m"
exit 0
