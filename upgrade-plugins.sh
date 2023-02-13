#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/upgrade-plugins.sh)
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

#ingest options
while :; do
    case $1 in
        debug|-debug|--debug)
                trap 'echo cmd: "$BASH_COMMAND" on line $LINENO exited with code: $?' DEBUG
        ;;
        dev|-dev|--dev)
                branch="dev"
        ;;
	php|-php|--php)
	branch="php"
        ;;
        *) break
    esac
    shift
done

# error handling
#set -eE
exit_trap() {
		local lc="$BASH_COMMAND" rc=$?
		if [ $rc -ne 0 ]; then
		printerror "Command [$lc] on $LINENO exited with code [$rc]"
		fi
}
trap exit_trap EXIT

case $1 in
	dev)
		branch=dev
	;;
	develop)
		branch=develop
	;;
	--switch-dev)
	;;
	*)
		branch=master
		counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=upgrade-plugins&write=0 )
	;;
esac

cd /var/www/html/cacti/plugins

for dir in ./*/
do
  cd ${dir}
  git status >/dev/null 2>&1
  # check if exit status of above was 0, indicating we're in a git repo
	[ $(echo $?) -eq 0 ] && echo "Updating ${dir%*/}..." && git pull
#[ $(printinfo $?) -eq 0 ] && echo "Updating ${dir%*/}..." && git checkout master && git pull
#[ $(printinfo "$?") -eq 0 ] && echo "Updating ${dir%*/}..." && git pull
  
  cd ..
done

function update-syslog-config () {
printinfo "Updating syslog plugin config..."
cd /var/www/html/
cp cacti/plugins/syslog/config.php.dist cacti/plugins/syslog/config.php
sed -i 's/cactiuser/cacti/g' cacti/plugins/syslog/config.php
}
