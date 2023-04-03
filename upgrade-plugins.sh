#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/upgrade-plugins.sh) dev
green=$(tput setaf 2)
red=$(tput setaf 1)
tan=$(tput setaf 3)
reset=$(tput sgr0)
branch=master

printinfo() {
	if [ -z "$1" ] then;
		printf "${tan}::: ${green}%s${reset}\n" "$(date +%a_%R) $@"
	else
		printf "${tan}::: ${green}%s${reset}\n" "$@"
	fi
	
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
		;;
		dev|-dev|--dev)
			branch="dev"
		;;
	    esac
	done
fi

cd /var/www/html/cacti/plugins

for dir in ./*/; do
	cd ${dir}
	git status >/dev/null 2>&1
	# check if exit status of above was 0, indicating we're in a git repo
	[ $(echo $?) -eq 0 ] && printinfo "Updating ${dir%*/}..." && git pull
	cd ..
done
printinfo
