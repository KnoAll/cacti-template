#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/install/smokeping/install-smokeping.sh)

case $(whoami) in
        root)
		echo -e "\033[31m You ran me as root! Do not run me as root!"
		echo -e -n "\033[0m"
		exit 1
		;;
        pi)
		echo -e "\033[31m You ran me as pi user! Do not run me as pi!"
		echo -e -n "\033[0m"
		exit 1
                ;;
        cacti)
		if [ -f ~/cacti-upgrade.sh ]
		then
			if grep -q "Raspbian GNU/Linux 9" /etc/os-release; then
				os_dist=raspbian
				os_name=Raspbian
				webserver=apache2
				webconf=/etc/apache2/sites-enabled
			elif grep -q "CentOS Linux 7" /etc/os-release; then
				os_dist=centos
				os_name=CentOS7
				webserver=httpd
				webconf=/etc/httpd/conf.d
			fi
		else
			echo -e "\033[31m You don't seem to have installed using Kevin's script/appliance, sorry exiting! http://www.kevinnoall.com"
			
			echo -e -n "\033[0m"	
		fi
                ;;
        *)
		echo -e "\033[31m Uh-oh. You are not logged in as the cacti user. Exiting..."
		echo -e -n "\033[0m"
		exit 1
                ;;
esac
case $1 in
	dev)
		param1=$1
		param2=$2
		branch=dev
	;;
	*)
		branch=master
	;;
esac

# get the Smokeping version
#upgrade_version=2.006011
prod_version=2.007003
web_version=2.7.3
dev_version=

if [ -f /opt/smokeping/bin/smokeping ];then
	echo -e "\033[31m Smokeping is already installed, you will need to upgrade not install from scratch or you will lose data, exiting..."
	echo -e -n "\033[0m"
	exit 1
fi

echo -e "\033[32m Welcome to Kevin's SmokePing install script!"
echo -e -n "\033[0m"
sudo echo ""

function upgrade-fping () {
                echo -e "\033[32m Checking fping version..."
                echo -e -n "\033[0m"
fping -4 -v > /dev/null 2>&1
if [ $? -ne 0 ];then
                echo -e "\033[31m Upgrading fping..."
                echo -e -n "\033[0m"
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
                echo -e "\033[32m fping version OK, moving on..."
                echo -e -n "\033[0m"
fi
}

function install-smokeping () {
echo -e "\033[32m Beginning SmokePing install..."
echo -e "\033[32m Installing required $os_name packages..."
echo -e -n "\033[0m"
cd
case $os_dist in
	raspbian)
		sudo apt install -y librrds-perl dnsutils daemon python3-pip libnet-ssleay-perl
		sudo a2enmod -q  cgi
		;;
	centos)
		sudo yum install -y -q perl-core perl-IO-Socket-SSL perl-Module-Build perl-rrdtool bind-utils
		;;
	*)
		echo -e "\033[31m Uh-oh. Sorry, unsupported OS Exiting..."
		exit 1
		;;
esac

if [ $? -ne 0 ];then
                echo -e "\033[31m Update error cannot install, exiting..."
                echo -e -n "\033[0m"
		exit 1
else
	echo -e "\033[32m Getting SmokePing..."
	echo -e -n "\033[0m"
	cd
	wget -q https://oss.oetiker.ch/smokeping/pub/smokeping-$web_version.tar.gz
	if [ $? -ne 0 ];then
                echo -e "\033[31m SmokePing download error cannot install, exiting..."
                echo -e -n "\033[0m"
		exit 1
	else
	tar -xzf smokeping-$web_version.tar.gz
		if [ $? -ne 0 ];then
                	echo -e "\033[31m SmokePing unpack error cannot install, exiting..."
                	echo -e -n "\033[0m"
			exit 1
		else
			echo -e "\033[32m Setting up SmokePing..."
			echo -e -n "\033[0m"
			#sudo systemctl stop smokeping.service
			#sudo mv /opt/smokeping /opt/smokeping_$smokever
			rm smokeping-$web_version.tar.gz
			cd smokeping-$web_version
			./configure --prefix=/opt/smokeping
			make install -s
			cd
			rm -rf smokeping-$web_version
			mkdir /opt/smokeping/var
			mkdir /opt/smokeping/data			
			mkdir /opt/smokeping/htdocs/cache
			update-config
			chmod 620 /opt/smokeping/etc/smokeping_secrets.dist
			echo -e "\033[32m Restarting services..."
			echo -e -n "\033[0m"
			wget -q https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/install/smokeping/smokeping-init.d
case $os_dist in
	centos)
		echo ""
	;;
	raspbian)
		sudo sed -i 's/etc\/rc.d\/init.d\/functions/lib\/lsb\/init-functions/g' smokeping-init.d
	;;
esac
			sudo mv smokeping-init.d /etc/init.d/smokeping			
			sudo chmod +x /etc/init.d/smokeping
			wget -q https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/install/smokeping/smokeping.conf
			sudo mv smokeping.conf $webconf/smokeping.conf
			sudo systemctl enable smokeping.service	&& sudo systemctl restart smokeping.service && sudo systemctl restart $webserver.service			
		fi
	fi
fi
}
			
function update-config () {
echo -e "\033[32m Updating SmokePing config..."
echo -e -n "\033[0m"
if [ -f  /opt/smokeping/etc/config ]; then
	 sudo sed -i 's/smokeping\/cache/smokeping\/htdocs\/cache/g' /opt/smokeping/etc/config
else
	sudo echo ""
	wget -q https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/install/smokeping/smokeping.config
	mv smokeping.config /opt/smokeping/etc/config
fi
}

function update-permissions () {
bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/update-permissions-smokeping.sh)
}

upgrade-fping
install-smokeping
update-permissions
case $param1 in
	dev)
	;;
	*)
	counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=smokeping-install-$os_dist&write=0 )
	echo ""
	echo ""
	counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=smokeping-install-$prod_version&write=0 )
	echo ""
	echo ""
	;;
esac
	echo -e "\033[32m Installed SmokePing v$prod_version at http://../smokeping/smokeping.cgi"
	echo -e -n "\033[0m"
exit 0
