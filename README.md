# cacti-template

:warning: **[This assumes you have Kevin's CentOS7 Cacti Template virtual appliance template] If you have gotten your Cacti install from Kevin's virtual appliance template .ova then this will work for you. You must not have made any changes to the Cacti directories or Apache settings. If you have installed Cacti via your own method or adjusted the template this will break your Cacti install!! :warning:

If you do not have Kevin's CentOS7 virtual appliance you can read more about it here.
http://www.kevinnoall.com/blog/2015/03/06/cacti-virtual-appliance/

As of the writing of this script, the current cacti release is v1.1.38. This script will upgrade to that release only. I am working on updates that will allow the upcoming development v1.2.x which is currently in beta 4. There are some significant changes required to support the new version which I am working through.

## Initial Upgrade Setup Instructions

Based on a Kevin's CentOS7 Cacti Template virtual appliance v1.1.6 or greater:
Run this from the command line...

```bash
bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/master/bootstrap.sh)
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
* ask if you would like to check for a compatible Smokeping upgrade
  * walks through Smokeping upgrade if desired backing up all data

Once the upgrade has been done, you must complete the installation from the Cacti web gui.
After the gui install has been done, you must go to Utilities > System Utilities and select 'Rebuild Poller Cache' or you will see errors in the cacti log


### Issues
This is all still actively being worked on, so you may see changes to how things work and interact.
If you run into trouble with the script please submit an issue in the Github system above.
