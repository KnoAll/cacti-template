#!/bin/bash

#bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/update-permissions-smokeping.sh)
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

if which yum >/dev/null; then
	pkg_mgr=yum
elif which apt >/dev/null; then
	pkg_mgr=apt
else
		printerror "You seem to be on something other than CentOS or Raspian, cannot proceed..."
		exit 1
fi

printinfo "Fixing file permissions..."
if [[ $pkg_mgr == "yum" ]]; then
	perm_grp=apache
else
	perm_grp=www-data
fi
groups | grep -q '\$permgrp\b'
if [ $? -ne 0 ];then
sudo usermod -a -G $perm_grp cacti
fi

sudo chown -R cacti /opt
sudo chgrp -R $perm_grp /opt
sudo find /opt -type d -exec chmod g+rwx {} +
sudo find /opt -type f -exec chmod g+rw {} +
sudo find /opt -type d -exec chmod u+rwx {} +
sudo find /opt -type f -exec chmod u+rw {} +
sudo find /opt -type d -exec chmod g+s {} +

exit
