#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/install/smokeping/install-smokeping.sh) dev

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

#ingest options
if [[ "$#" > 0 ]]; then
	for var in "$@"; do
	    case $var in
		debug|-debug|--debug)
			trap 'echo cmd: "$BASH_COMMAND" on line $LINENO exited with code: $?' DEBUG
			printwarn "Now DEBUGGING"
		;;
		dev|-dev|--dev)
			param1=$1
			param2=$2
			branch=dev
			printwarn "Now on DEV branch."
		;;
		*)
			branch=master
		;;
	    esac
	done
else
	branch=master
fi

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
		if [ -f ~/cacti-upgrade.sh ]; then
			if grep -q "Raspbian GNU/Linux 10" /etc/os-release; then
				os_dist=raspbian
				os_name=Raspbian
				webserver=apache2
				webconf=/etc/apache2/sites-enabled
			elif grep -q "CentOS Linux 7" /etc/os-release; then
				os_dist=centos
				os_name=CentOS7
				webserver=httpd
				webconf=/etc/httpd/conf.d
			elif grep -q "AlmaLinux" /etc/os-release; then
				os_dist=almalinux
				os_name=AlmaLinux
				webserver=httpd
				webconf=/etc/httpd/conf.d
			elif grep -q "Rocky Linux 9" /etc/os-release; then
				os_dist=rockylinux
				os_name=RockyLinux
				webserver=httpd
				webconf=/etc/httpd/conf.d
			fi
		else
			printerror "You don't seem to have installed using Kevin's script/appliance, sorry exiting! http://www.kevinnoall.com"	
		fi
                ;;
        *)
		printerror "Uh-oh. You are not logged in as the cacti user. Exiting..."
		exit 1
                ;;
esac

# get the Smokeping version
#upgrade_version=2.006011
prod_version=2.008002
web_version=2.8.2
dev_version=

if [ -f /opt/smokeping/bin/smokeping ];then
	printerror "Smokeping is already installed, you will need to upgrade not install from scratch or you will lose data, exiting..."
	exit 1
fi
printinfo "Welcome to Kevin's SmokePing install script!"
sudo echo
printinfo

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

function install-smokeping () {
printinfo "Beginning SmokePing install..."
printinfo "Installing required $os_name packages..."
cd
case $os_dist in
	raspbian)
		sudo apt install -y librrds-perl dnsutils daemon python3-pip libnet-ssleay-perl
		sudo a2enmod -q  cgi
	;;
	centos)
		sudo yum install -y -q perl-core perl-IO-Socket-SSL perl-Module-Build perl-rrdtool bind-utils
	;;
	almalinux|rockylinux)
		sudo dnf install -y -q perl-core perl-rrdtool bind-utils sendmail
	;;
	*)
		printinfo "Uh-oh. Sorry, unsupported OS Exiting..."
		exit 1
		;;
esac

if [ $? -ne 0 ];then
                printerror "Update error cannot install, exiting..."
		exit 1
else
	printinfo "Getting SmokePing..."
	cd
	wget -q https://oss.oetiker.ch/smokeping/pub/smokeping-$web_version.tar.gz
	if [ $? -ne 0 ];then
                printerror "SmokePing download error cannot install, exiting..."
		exit 1
	else
	tar -xzf smokeping-$web_version.tar.gz
		if [ $? -ne 0 ];then
                	printerror "SmokePing unpack error cannot install, exiting..."
			exit 1
		else
			printinfo "Setting up SmokePing..."
			#sudo systemctl stop smokeping.service
			#sudo mv /opt/smokeping /opt/smokeping_$smokever
			rm smokeping-$web_version.tar.gz
			cd smokeping-$web_version
			./configure --prefix=/opt/smokeping
			sudo make install -s
			cd
			sudo rm -rf smokeping-$web_version
			sudo mkdir /opt/smokeping/var
			sudo mkdir /opt/smokeping/data			
			sudo mkdir /opt/smokeping/htdocs/cache
			update-config
			sudo chmod 620 /opt/smokeping/etc/smokeping_secrets.dist
			printinfo "Restarting services..."

case $os_dist in
	centos)
		printinfo
		wget -q https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/install/smokeping/smokeping-init.d
			if [ $? -ne 0 ];then
				printerror "Error downloading SmokePing startup script."
				printerror "$branch, $os_dist, $webserver, $webconf"
			fi
		sudo mv smokeping-init.d /etc/init.d/smokeping			
		sudo chmod +x /etc/init.d/smokeping
		wget -q https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/install/smokeping/smokeping.conf
		sudo mv smokeping.conf $webconf/smokeping.conf
		sudo systemctl enable smokeping.service	&& sudo systemctl restart smokeping.service && sudo systemctl restart $webserver.service
	;;
	raspbian)
		printinfo
		wget -q https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/install/smokeping/smokeping-init.d
			if [ $? -ne 0 ];then
				printerror "Error downloading SmokePing startup script."
				printerror "$branch, $os_dist, $webserver, $webconf"
			fi
		sudo sed -i 's/etc\/rc.d\/init.d\/functions/lib\/lsb\/init-functions/g' smokeping-init.d
		sudo mv smokeping-init.d /etc/init.d/smokeping			
		sudo chmod +x /etc/init.d/smokeping
		wget -q https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/install/smokeping/smokeping.conf
		sudo mv smokeping.conf $webconf/smokeping.conf
		sudo systemctl enable smokeping.service	&& sudo systemctl restart smokeping.service && sudo systemctl restart $webserver.service
	;;
	almalinux|rockylinux)
		wget -q https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/install/smokeping/smokeping-init.d
		if [ $? -ne 0 ];then
			printerror "Error downloading SmokePing startup script."
			printerror "$branch, $os_dist, $webserver, $webconf"
		fi
		https://raw.githubusercontent.com/KnoAll/cacti-template/dev/install/smokeping/smokeping.config
		sudo mv smokeping-init.d /etc/systemd/system/smokeping.service
		sudo systemctl enable smokeping && sudo systemctl start smokeping && sudo systemctl status smokeping
	;;
esac
			
		fi
	fi
fi
}
			
function update-config () {
printinfo "Updating SmokePing config..."
if [ -f  /opt/smokeping/etc/config ]; then
	 sudo sed -i 's/smokeping\/cache/smokeping\/htdocs\/cache/g' /opt/smokeping/etc/config
else
	sudo echo
	printinfo
	wget -q https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/install/smokeping/smokeping.config && sudo mv smokeping.config /opt/smokeping/etc/config
fi
}

function update-permissions () {
	printinfo "Checking Permissions"
	bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/$branch/update-permissions-smokeping.sh)
	printinfo
}

upgrade-fping
update-permissions
install-smokeping
update-permissions
case $param1 in
	dev)
	;;
	*)
		counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=smokeping-install-$os_dist&write=0 )
		printinfo ""
		counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=smokeping-install-$prod_version&write=0 )
		printinfo ""
	;;
esac
	printinfo "Installed SmokePing v$prod_version at http://../smokeping/smokeping.cgi"
exit 0
