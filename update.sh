#!/bin/bash

if [[ `whoami` == "root" ]]; then
    echo "You ran me as root! Do not run me as root!"
    exit 1
fi

# bash <(curl -s http://www.kevinnoall.com/x/interactive.sh)

function upgrade-git () {
echo "Upgrading Git"
rpm -U http://opensource.wandisco.com/centos/7/git/x86_64/wandisco-git-release-7-2.noarch.rpm \
    && yum install -y git
	
}

function backup-db () {
mysqldump --user=cacti --password=cacti -l --add-drop-table cacti |gzip > mysql.cacti_$(date +\%Y\%m\%d).sql.gz
}

function cacti-upgrade () {
echo "Begining Cacti upgrade."
cd /var/www/html/cacti
}
