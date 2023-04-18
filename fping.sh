#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/fping.sh) dev debug

green=$(tput setaf 2)
red=$(tput setaf 1)
tan=$(tput setaf 3)
reset=$(tput sgr0)
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

function check-fping () {
	printinfo "Checking for fping..."
	if [ -x "$(command -v fping)" ]; then
		printinfo "fping OK, moving on..."
	else
		printinfo "Setting up fping..."
		cd
		git clone https://github.com/schweikert/fping.git
		cd fping/
		git checkout master
		./autogen.sh
		./configure --prefix=/usr --enable-ipv4 --enable-ipv6
		sudo make
		sudo make install
		sudo chmod +s /usr/sbin/fping
		sudo setcap cap_net_raw+ep /usr/sbin/fping
		cd
		rm -rf fping
		[ -x "$(command -v fping)" ] && printinfo "fping setup..." || printerror "fping did not install, please attempt manually."
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
    esac
done

check-fping
