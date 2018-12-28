#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/upgrade-smokeping.sh)

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

# get the Smokeping version
upgrade_version=2.006011
prod_version=2.007003
web_version=2.7.3
dev_version=
smokever=$( /opt/smokeping/bin/smokeping --version )
if [ $? -ne 0 ];then
	echo -e "\033[31m Smokeping is either not installed or not compatible with minimum required v$upgrade_version cannot proceed, exiting..."
	echo -e -n "\033[0m"
	exit 1
fi

function version_ge() { test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" == "$1"; }
function version_lt() { test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" != "$1"; }

if version_ge $smokever $upgrade_version; then
        if version_ge $smokever $prod_version; then
                echo -e "\033[32m Smokeping v$smokever is up to date with production v$prod_version, nothing to do, exiting!"
		echo -e -n "\033[0m"
                exit 0
        else
			echo ""
			echo -e "\033[32m Installed Smokeping v$smokever is compatible with minimum required, do you wish to upgrade to v$prod_version?"
			echo -e -n "\033[0m"
			read -n 1 -p "y/n: " smokeup1
       		 		if [ "$smokeup1" = "y" ]; then
					echo ""
				else
					echo ""
					echo -e "\033[32m OK, no Smokeping thing, bye!"
					echo -e -n "\033[0m"
					exit
				fi
        fi
else
	echo -e "\033[31m Smokeping v$smokever is less than upgrade version v$upgrade_version cannot install, exiting..."
	echo -e -n "\033[0m"
	exit 1
fi

echo -e "\033[32m Welcome to Kevin's Smokeping upgrade script!"
echo -e -n "\033[0m"
sudo echo ""

function upgrade-smokeping () {
echo -e "\033[32m Begining Smokeping upgrade..."
echo -e "\033[32m Updating CentOS packages..."
echo -e -n "\033[0m"
cd
sudo yum install -y -q perl-core perl-IO-Socket-SSL perl-Module-Build
if [ $? -ne 0 ];then
                echo -e "\033[31m CentOS update error cannot install, exiting..."
                echo -e -n "\033[0m"
		exit 1
else
	echo -e "\033[32m Getting Smokeping..."
	echo -e -n "\033[0m"
	wget -q https://oss.oetiker.ch/smokeping/pub/smokeping-$web_version.tar.gz
	if [ $? -ne 0 ];then
                echo -e "\033[31m Smokeping download error cannot install, exiting..."
                echo -e -n "\033[0m"
		exit 1
	else
	tar -xzf smokeping-$web_version.tar.gz
		if [ $? -ne 0 ];then
                	echo -e "\033[31m Smokeping unpack error cannot install, exiting..."
                	echo -e -n "\033[0m"
			exit 1
		else
			echo -e "\033[32m Setting up Smokeping..."
			echo -e -n "\033[0m"
			sudo systemctl stop smokeping.service
			sudo mv /opt/smokeping /opt/smokeping_$smokever
			rm smokeping-$web_version.tar.gz
			cd smokeping-$web_version
			./configure --prefix=/opt/smokeping
			make install
			cd
			rm -rf smokeping-$web_version
			mkdir /opt/smokeping/var
			mkdir /opt/smokeping/htdocs/cache
			cp /opt/smokeping_$smokever/etc/config /opt/smokeping/etc/
			update-config
			cp -R /opt/smokeping_$smokever/data /opt/smokeping/data
			cp -a /opt/smokeping_$smokever/etc/smokeping_secrets.dist /opt/smokeping/etc/
			update-permissions
			chmod 620 /opt/smokeping/etc/smokeping_secrets.dist
			echo -e "\033[32m Restarting services..."
			echo -e -n "\033[0m"
			sudo systemctl start smokeping.service && sudo systemctl restart httpd.service
			echo ""
		fi
	fi
fi
}

function update-config () {
echo -e "\033[32m Updating Smokeping config..."
echo -e -n "\033[0m"
if [ -f  /opt/smokeping/etc/config ];
then
	echo "$(awk '{sub(/\/cache/,"\/htdocs\/cache")}1' /opt/smokeping/etc/config)" > /opt/smokeping/etc/config
fi
}


function update-permissions () {
echo -e "\033[32m Fixing file permissions..."
echo -e -n "\033[0m"
sudo chown -R cacti /opt
sudo chgrp -R apache /opt
sudo find /opt -type d -exec chmod g+rwx {} +
sudo find /opt -type f -exec chmod g+rw {} +
sudo find /opt -type d -exec chmod u+rwx {} +
sudo find /opt -type f -exec chmod u+rw {} +
sudo find /opt -type d -exec chmod g+s {} +
}

function compress-delete () {
	echo -e "\033[32m Do you want to archive the original Smokeping directory?"
	echo -e -n "\033[0m"
	read -n 1 -p "y/n: " cleanup
        if [ "$cleanup" = "y" ]; then
		echo ""
		echo -e "\033[32m Creating compressed archive..."
		echo -e -n "\033[0m"
		tar -pczf ~/backup_smokeping-$smokever.tar.gz -C /opt smokeping_$smokever
		if [ $? -ne 0 ];then
			echo -e "\033[31m Archive creation failed."
			echo -e -n "\033[0m"
		else
			rm -rf /opt/smokeping_$smokever
			echo -e "\033[32m Archive created in home directory ~/backup_smokeping-$smokever.tar.gz..."
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

update-permissions
upgrade-smokeping
update-permissions
compress-delete
echo -e "\033[32m Smokeping upgraded to v$prod_version! Proceed to the web interface..."
echo -e -n "\033[0m"
exit 0
