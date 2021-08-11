#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/upgrade-smokeping.sh)

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

# get the Smokeping version
upgrade_version=2.006011
prod_version=2.008000
web_version=2.8.0
dev_version=
smokever=$( /opt/smokeping/bin/smokeping --version )
if [ $? -ne 0 ];then
	printerror "Smokeping is either not installed or not compatible with minimum required v$upgrade_version cannot proceed, exiting..."
	exit 1
fi

function version_ge() { test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" == "$1"; }
function version_lt() { test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" != "$1"; }

function checkVer () {
if version_ge $smokever $upgrade_version; then
        if version_ge $smokever $prod_version; then
                printinfo "Smokeping v$smokever is up to date with production v$prod_version, nothing to do, exiting!"
                exit 0
        else
			printinfo "Installed Smokeping v$smokever is compatible with minimum required, do you wish to upgrade to v$prod_version?"
			read -p "Y/n: " smokeup1
			smokeup1=${smokeup1:-Y}
			case "$smokeup1" in
			y | Y | yes | YES| Yes ) 
				printinfo
			;;
			n | N | no | NO | No )
				printinfo "OK, no Smokeping thing, bye!"
				exit 1
			;;
			* )
				printerror "You have entered an invallid selection!"
				printinfo "Please try again!"
				checkVer
			;;
			esac
        fi
else
	printwarn "Smokeping v$smokever is less than upgrade version v$upgrade_version cannot install, exiting..."
	exit 1
fi
}

printinfo "Welcome to Kevin's Smokeping upgrade script!"
sudo echo

function upgrade-fping () {
	printinfo "Checking fping version..."
	fping -4 -v > /dev/null 2>&1
	if [ $? -ne 0 ];then
		printinfo "Upgrading fping..."
		cd
		git clone https://github.com/schweikert/fping.git
		cd fping/
		git checkout master
		./autogen.sh
		./configure --prefix=/usr --enable-ipv4 --enable-ipv6
		sudo make
		sudo make install
		sudo chmod +s /usr/sbin/fping
		cd
		rm -rf fping
	else
		printinfo "fping version OK, moving on..."
	fi
}

function upgrade-smokeping () {
	printinfo "Beginning Smokeping upgrade..."
	printinfo "Updating CentOS packages..."
	cd
	sudo yum install -y -q perl-core perl-IO-Socket-SSL perl-Module-Build
	if [ $? -ne 0 ];then
			printerror "CentOS update error cannot install, exiting..."
			exit 1
	else
		printinfo "Getting Smokeping..."
		cd
		wget -q https://oss.oetiker.ch/smokeping/pub/smokeping-$web_version.tar.gz
		if [ $? -ne 0 ];then
			printerror "Smokeping download error cannot install, exiting..."
			exit 1
		else
		tar -xzf smokeping-$web_version.tar.gz
			if [ $? -ne 0 ];then
				printerror "Smokeping unpack error cannot install, exiting..."
				exit 1
			else
				printinfo "Setting up Smokeping..."
				sudo systemctl stop smokeping.service
				sudo mv /opt/smokeping /opt/smokeping_$smokever
				rm smokeping-$web_version.tar.gz
				cd smokeping-$web_version
				./configure --prefix=/opt/smokeping
				make install -s
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
				printinfo "Restarting services..."
				sudo systemctl start smokeping.service && sudo systemctl restart httpd.service
				counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=smokeping-$smokever-$prod_version&write=0 )
				printinfo
			fi
		fi
	fi
}

function update-config () {
	printinfo "Updating Smokeping config..."
	if [ -f  /opt/smokeping/etc/config ];
	then
		 sudo sed -i 's/smokeping\/cache/smokeping\/htdocs\/cache/g' /opt/smokeping/etc/config
	fi
}


function update-permissions () {
	printinfo "Fixing file permissions..."
	sudo chown -R cacti /opt
	sudo chgrp -R apache /opt
	sudo find /opt -type d -exec chmod g+rwx {} +
	sudo find /opt -type f -exec chmod g+rw {} +
	sudo find /opt -type d -exec chmod u+rwx {} +
	sudo find /opt -type f -exec chmod u+rw {} +
	sudo find /opt -type d -exec chmod g+s {} +
}

function compress-delete () {
	printinfo "Do you want to archive the original Smokeping directory?"
	read -p "Y/n: " cleanup
	cleanup=${cleanup:-Y}
	case "$cleanup" in
	y | Y | yes | YES| Yes ) 
		printinfo
		printinfo "Creating compressed archive..."
		tar -pczf ~/backup_smokeping-$smokever.tar.gz -C /opt smokeping_$smokever
		if [ $? -ne 0 ];then
			printerror "Archive creation failed."
		else
			rm -rf /opt/smokeping_$smokever
			printinfo "Archive created in home directory ~/backup_smokeping-$smokever.tar.gz..."		
		fi
	;;
	n | N | no | NO | No )
		printinfo
	;;
	* )
		printwarn "You have entered an invallid selection!"
		printinfo "Please try again!"
		compress-delete
	;;
	esac
}

checkVer
update-permissions
upgrade-fping
upgrade-smokeping
update-permissions
compress-delete
printinfo "Smokeping upgraded to v$prod_version! Proceed to the web interface..."
exit 0
