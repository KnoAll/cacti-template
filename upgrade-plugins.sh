#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/master/upgrade-plugins.sh)

function upgrade-plugins () {
echo -e "\033[32m Upgrading plugins..."
echo -e -n "\033[0m"
cd /var/www/html/
echo -e "\033[32m Upgrading Mactrack..."
echo -e -n "\033[0m"
git clone https://github.com/Cacti/plugin_mactrack.git cacti/plugins/mactrack
echo ""
echo -e "\033[32m Upgrading Monitor..."
echo -e -n "\033[0m"
git clone https://github.com/Cacti/plugin_monitor.git cacti/plugins/monitor
echo ""
echo -e "\033[32m Upgrading Webseer..."
echo -e -n "\033[0m"
git clone https://github.com/Cacti/plugin_webseer.git cacti/plugins/webseer
echo ""
echo -e "\033[32m Upgrading GExport..."
echo -e -n "\033[0m"
git clone https://github.com/Cacti/plugin_gexport.git cacti/plugins/gexport
echo ""
echo -e "\033[32m Upgrading Syslog..."
echo -e -n "\033[0m"
git clone https://github.com/Cacti/plugin_syslog.git cacti/plugins/syslog
echo -e "\033[32m Updating syslog config..."
echo -e -n "\033[0m"
update-syslog-config
echo ""
echo -e "\033[32m Upgrading THold..."
echo -e -n "\033[0m"
git clone https://github.com/Cacti/plugin_thold.git cacti/plugins/thold
echo ""
echo -e "\033[32m Upgrading Routerconfigs..."
echo -e -n "\033[0m"
git clone https://github.com/Cacti/plugin_routerconfigs.git cacti/plugins/routerconfigs
echo ""
echo -e "\033[32m Upgrading FlowView..."
echo -e -n "\033[0m"
git clone https://github.com/Cacti/plugin_flowview.git cacti/plugins/flowview
echo ""
echo -e "\033[32m Upgrading Maint..."
echo -e -n "\033[0m"
git clone https://github.com/Cacti/plugin_maint.git cacti/plugins/maint
echo ""
echo -e "\033[32m Upgrading Audit..."
echo -e -n "\033[0m"
git clone https://github.com/Cacti/plugin_audit.git cacti/plugins/audit
echo ""
echo -e "\033[32m Upgrading Cycle..."
echo -e -n "\033[0m"
git clone https://github.com/Cacti/plugin_cycle.git cacti/plugins/cycle
echo ""
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
}
