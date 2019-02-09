#!/bin/bash

echo -e "\033[32m Updating Apache permissions"
echo -e -n "\033[0m"
if [[ $os_dist == "raspbian" ]]; then
	sudo chgrp -R www-data /var/www/html/cacti/log
	sudo chgrp -R www-data /var/www/html/cacti/resource
	sudo chgrp -R www-data /var/www/html/cacti/cache
	sudo chgrp -R www-data /var/www/html/cacti/scripts
	if [ $? -ne 0 ];then
		echo -e "\033[31m Something went updating permissions, exiting..."
		echo -e -n "\033[0m"
		exit 1
	else
		sudo chmod -R g+w /var/www/html/
			if [ $? -ne 0 ];then
				echo -e "\033[31m Something went updating permissions, exiting..."
				echo -e -n "\033[0m"
				exit 1
			else
				sudo find /var/www/html -type d -exec chmod g+rwx {} +
				sudo find /var/www/html -type f -exec chmod g+rw {} +
				sudo find /var/www/html -type d -exec chmod u+rwx {} +
				sudo find /var/www/html -type f -exec chmod u+rw {} +
				sudo find /var/www/html -type d -exec chmod g+s {} +
			fi	
	fi
elif [[ $os_dist == "centos" ]]; then
	sudo chgrp -R apache /var/www/html/cacti/log
	sudo chgrp -R apache /var/www/html/cacti/resource
	sudo chgrp -R apache /var/www/html/cacti/cache
	sudo chgrp -R apache /var/www/html/cacti/scripts
	if [ $? -ne 0 ];then
		echo -e "\033[31m Something went updating permissions, exiting..."
		echo -e -n "\033[0m"
		exit 1
	else
		sudo chmod -R g+w /var/www/html/
			if [ $? -ne 0 ];then
				echo -e "\033[31m Something went updating permissions, exiting..."
				echo -e -n "\033[0m"
				exit 1
			else
				sudo find /var/www/html -type d -exec chmod g+rwx {} +
				sudo find /var/www/html -type f -exec chmod g+rw {} +
				sudo find /var/www/html -type d -exec chmod u+rwx {} +
				sudo find /var/www/html -type f -exec chmod u+rw {} +
				sudo find /var/www/html -type d -exec chmod g+s {} +
			fi	
	fi
fi
