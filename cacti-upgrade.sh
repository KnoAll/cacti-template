#!/bin/bash

if [ -f ~/.cacti-template ]
then
  bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/master/update-git.sh)
else
	echo "Cacti is not already installed based on Kevin's cacti-template, sorry cannot upgrade. Exiting..."
    sleep 5
    exit 1
fi
