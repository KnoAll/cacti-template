#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/upgrade-spine.sh) dev
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
printNotices() {
	notices=$(curl -s http://kevinnoall.com/notices.txt) && printinfo "$notices" && printinfo
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

#get the version of cacti that is installed
cactiver=$( cat /var/www/html/cacti/include/cacti_version )

#check that spine is installed, if so get the version
test -f /usr/local/spine/bin/spine
	if [ $? -ne 0 ];then
		printerror "Spine does not appear to be installed, exiting."
		exit 1
	else
		spinever=$(/usr/local/spine/bin/spine -v | cut -c 7-12)
	fi


if [[ $1 == "dev" || $1 == "--switch-dev" ]]; then
	param1=$1
	param2=$2
	branch=dev
	printwarn "Now on DEV branch."
else
	printinfo
	branch=master
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

upgradeAsk () {
	printinfo "Found compatible Cacti v$cactiver installed, do you want to upgrade to v$cactiver?"
	read -p "y/N: " upAsk
	upAsk=${upAsk:-N}
		case "$upAsk" in
		y | Y | yes | YES| Yes ) 
			printinfo "Ok, let's go!"
		;;
		n | N | no | NO | No )
			printwarn "OK, maybe next time, exiting now..."
			exit 1
		;;
		* ) 
			printwarn "You have entered an invallid selection!"
			printinfo "Please try again!"
			upgradeAsk
		;;
		esac
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
	wget -q https://www.cacti.net/downloads/spine/cacti-spine-$cactiver.tar.gz
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
	sudo $pgk_mgr install -y -q gcc glibc glibc-common gd gd-devel net-snmp-devel
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

if version_ge $cactiver $spinever; then
upgrade-spine
  if [ $? -ne 0 ];then
    printerror "Spine install error, exiting. You will need to manually upgrade Spine."
    exit 1
  fi
printinfo "Spine Upgraded"
exit 0
fi
