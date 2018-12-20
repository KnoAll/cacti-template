#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/master/upgrade-plugins.sh)

for dir in ./*/
do
  cd ${dir}
  git status >/dev/null 2>&1
  # check if exit status of above was 0, indicating we're in a git repo
  [ $(echo $?) -eq 0 ] && echo "Updating ${dir%*/}..." && git pull
  cd ..
done


#echo "Upgrading Weathermap..."
#echo -e -n "\033[0m"
#git clone https://github.com/howardjones/network-weathermap.git --single-branch cacti/plugins/weathermap
#echo ""
#echo "Installing Weathermap..."
#echo -e -n "\033[0m"
#cd cacti/plugins/weathermap/
#bower install --allow-root
#composer update --no-dev
#echo ""
