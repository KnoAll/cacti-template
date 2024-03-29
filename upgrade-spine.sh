#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/upgrade-spine.sh) dev
green=$(tput setaf 2)
red=$(tput setaf 1)
tan=$(tput setaf 3)
reset=$(tput sgr0)
errorcount=0
branch=master

printinfo() {
	if [ -z "$1" ]; then
		printf "${tan}::: ${green}%s${reset}\n" "$@"
	else
		printf "${tan}::: ${green}%s${reset}\n" "$(date +%a_%R): $@"
	fi	
}
printwarn() {
	printf "${tan}*** WARNING: %s${reset}\n" "$(date +%a_%R): $@"
}
printerror() {
	printf "${red}!!! ERROR: %s${reset}\n" "$(date +%a_%R): $@"
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

#determine the os pkg version
if [ -x "$(command -v dnf)" ]; then
	pkg_mgr=dnf
	os_dist=almalinux
elif [ -x "$(command -v apt)" ]; then
	pkg_mgr=apt
	os_dist=raspbian
elif [ -x "$(command -v yum)" ]; then
	pkg_mgr=yum
	os_dist=centos
else
	printerror "You seem to be on something other than CentOS/Alma/Rocky or Raspian, cannot proceed..."
	exit 1
fi

function checkSpine() {
	#check that spine is installed, if so get the version
	if [ -f /usr/local/spine/bin/spine ]; then
			spinever=$(/usr/local/spine/bin/spine -v | cut -c 7-12)
		else
			printerror "Spine does not appear to be installed..."
		fi
}

function version_ge() { test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" == "$1"; }
function version_lt() { test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" != "$1"; }

function upgrade-spine () {
	printinfo "Installing Spine v$cactiver..."
	cd
	if [[ $1 == "develop" ]]; then
		printinfo "Cloning from Git..."
		git clone https://github.com/Cacti/spine.git
		cd spine
		git checkout $1
		printinfo "Bootstrapping spine..."
		./bootstrap
	else
		wget -q --no-check-certificate https://www.cacti.net/downloads/spine/cacti-spine-$cactiver.tar.gz
		if [ $? -ne 0 ];then
				printerror "Spine download error cannot install, exiting. You will need to manually upgrade Spine."
				rm -rf *spine*
				exit 1
		else
			tar -xzf cacti-spine-*.tar.gz
			rm cacti-spine-*.tar.gz
			cd cacti-spine-*
		fi
	fi
	
	case $pkg_mgr in
		yum)
			printinfo "Setting up yum dependencies"
			sudo yum install -y -q gcc glibc glibc-common gd gd-devel net-snmp-devel
		;;
		dnf)
			printinfo "Setting up dnf dependencies"
			sudo dnf --enablerepo=crb install -y -q mysql-devel help2man		
		;;
		apt)
			printinfo "Setting up apt dependencies"
			sudo -S $pkg_mgr install -y -qq gcc glibc-doc build-essential gdb autoconf		
		;;
	esac

	./bootstrap
		if [ $? -ne 0 ];then
			printerror "Spine bootstrap error, exiting. You will need to manually upgrade Spine."
			exit 1
		fi
		printinfo
	./configure
		if [ $? -ne 0 ];then
			printerror "Spine configure error, exiting. You will need to manually upgrade Spine."
			exit 1
		fi
		printinfo
	make 
		if [ $? -ne 0 ];then
			printerror "Spine make error, exiting. You will need to manually upgrade Spine."
			exit 1
		fi
		printinfo
	sudo -S make install
		if [ $? -ne 0 ];then
			printerror "Spine make install error, exiting. You will need to manually upgrade Spine."
			exit 1
		fi
		printinfo "Cleaning up..."
	cd /usr/local/spine/bin
	sudo -S chown root:root spine
	sudo -S chmod +s spine
	printinfo
	cd
	rm -rf *spine*
}

function pick-version() {
	read -p "What version of Spine do you want to install? " cactiver
	upgrade-spine
}

function copyConfig() {
	if [ -f /usr/local/spine/etc/spine.conf ]; then
		printinfo
	else
		sudo cp /usr/local/spine/etc/spine.conf.dist /usr/local/spine/etc/spine.conf
		sudo sed -i 's/cactiuser/cacti/g' /usr/local/spine/etc/spine.conf
	fi
}


#ingest options
for var in "$@"; do
    case $var in
	debug|-debug|--debug)
		printwarn "Now DEBUGGING!"
		trap 'echo cmd: "$BASH_COMMAND" on line $LINENO exited with code: $?' DEBUG
	;;
	dev|-dev|--dev)
		printwarn "Switching to DEV branch..."
		branch="dev"
	;;
	install)
		spinever=1.2.24
	;;
	--pick-version)
		if [ -z "$2" ]; then
			pick-version
			spinever=$(/usr/local/spine/bin/spine -v | cut -c 7-12)
			printinfo "Installed Spine v$spinever"
			if [ "$branch" = dev ];then
				printinfo
			else
				counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=spine-upgrade&write=0 )
			fi
			exit 0
		else
			cactiver=$2
			upgrade-spine
			spinever=$(/usr/local/spine/bin/spine -v | cut -c 7-12)
			printinfo "Installed Spine v$spinever"
			if [ "$branch" = dev ];then
				printinfo
			else
				counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=spine-upgrade&write=0 )
			fi
			exit 0
		fi
	;;
	--help | --h | --H | -h | help | -? | --? )
		printinfo "Switches available in this script:"
		printinfo "--pick-version	Enter the version number of Spine to be installed. Format is number only, example: 1.2.3"
		printinfo "	with --pick-version, optional version number argument also available. Example: --pick-version 1.2.3"
	;;
    esac
done

checkSpine
if version_lt $spinever $cactiver ; then
upgrade-spine
	if [ $? -ne 0 ];then
		printerror "Spine install error, exiting. You will need to manually upgrade Spine."
		exit 1
	fi
copyConfig
spinever=$(/usr/local/spine/bin/spine -v | cut -c 7-12)
printinfo "Installed Spine v$spinever"
else
	printwarn "Spine v$spinever already matches Cacti v$cactiver, exiting..."
	exit 0
fi

if [ "$branch" = dev ];then
	printinfo
else
	counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=spine-upgrade&write=0 )
fi
