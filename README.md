# cacti-template

:warning: **[This assumes you have Kevin's CentOS7 Cacti Template virtual appliance template] If you have gotten your cacti install from Kevin's virtual appliance template .ova then this will work for you. If you have installed Cacti via your own method this will break your Cacti install!! :warning:

If you do not have Kevin's CentOS7 virtual appliance you can read more about it here.
http://www.kevinnoall.com/blog/2015/03/06/cacti-virtual-appliance/

## Initial Upgrade Setup Instructions

Based on a Kevin's CentOS7 Cacti Template virtual appliance v1.1.6 or greater:
Run this from the command line...

```bash
bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/master/cacti-upgrade.sh)
```

Subsequent updates can be run by simply 
```bash
./cacti-upgrade
```
from the cacti user's home directory.

The script will:
* download the cacti-upgrade.sh script
* check for proper user
* check for cacti version compatiblity
* backup the cacti db into an archive in the cacti directory
* upgrade cacti to the current production release
  * preserve your existing data by copying over all data rras, script and snmp queries, resource files, and plugins
* upgrade spine to the current production release
  * upgrade centos with any updates nessesary for compiling spine
* archive your previous cacti install

Once the upgrade has been done, you must complete the installation from the cacti gui.
After the gui install has been done, you must go to Utilities > System Utilities and select 'Rebuild Poller Cache' or you will see errors in the cacti log


### Issues
If you run into trouble with the script please submit an issue in the Github system above.
