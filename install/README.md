## SmokePing install
SmokePing can be installed as part of the Cacti install. If you already have an installed Cacti from my script and want to add SmokePing, please visit [SmokePing installation script](smokeping) to install SmokePing

# Cacti network grapher installation
:warning: **[This assumes you have a brand-new, clean, un-used/updated version of AlmaLinux or RockyLinux] You must not have made any changes to the OS. If you have installed Cacti or any other software via your own method or adjusted the OS this will break your Cacti install!! :warning:

As of the writing of this script, the current cacti release is v1.2.23. I will keep this script updated to follow the official Cacti releases, and you can use the cacti-upgrade.sh moving forward.


## Issues
This is all still actively being worked on, so you may see changes to how things work and interact.
If you run into trouble with the script please [submit an issue](../../../issues/) in the Github system above.


## Initial install Setup Instructions

Based on a clean, current AlmaLinux/RockyLinux default install. This is updated from being Legacy Centos7/8 which are no longer viable in this install script due to being sunsetted by RedHat.

#### AlmaLinux/RockyLinux requirements: You must have already setup a 'cacti' user with sudoer rights. This script will kick out if not running under that user.

Run this from the command line...
```bash
bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/master/install/install.sh)
```

Subsequent updates can be run by simply 
```bash
./cacti-upgrade
```
from the cacti user's home directory. **Be sure to run the upgrade after initial install as this install script may not be updated with every Cacti release.**

The script will:
* check for os version compatiblity
* download the cacti-upgrade.sh script
* install the required software packages
* setup the cacti database and user
 * asks if you want to use an untouched cacti databse or a tweaked database that I use
  * you must use the untouched database if you are setting up a remote poller
* install cacti to the current production release
* install spine to the current production release

The install has to setup matching timezone information for OS/PHP/MYSQL, so it will stomp on anything you might have setup originally. Apologies for this, you will have to change it back to wherever you are after install.

Once the installation has been done, you must complete the installation from the Cacti web gui.
After the gui install has been done, you must go to Utilities > System Utilities and select 'Rebuild Poller Cache' or you will see errors in the cacti log
