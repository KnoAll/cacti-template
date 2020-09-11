#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/php-upgrade.sh)

sudo yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm

sudo yum install -y yum-utils

sudo yum-config-manager --enable remi-php74

sudo yum -y update && sudo yum -y upgrade

exit 0
