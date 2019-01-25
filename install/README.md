# cacti-install

:warning: **[This assumes you have a brand-new, clean, un-used/updated version of  Raspian Stretch Lite.] You must not have made any changes to the OS. If you have installed Cacti or any other software via your own method or adjusted the OS this will break your Cacti install!! :warning:

As of the writing of this script, the current cacti release is v1.2.1. I will keep this script updated to follow the official Cacti releases, and you can use the cacti-upgrade.sh moving forward.

## Initial install Setup Instructions

Based on a clean Raspian Stretch Lite default install.
Run this from the command line...

```bash
bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/master/install/install-rpi.sh)
```

Subsequent updates can be run by simply 
```bash
./cacti-upgrade
```
from the cacti user's home directory.

The script will:
* download the cacti-upgrade.sh script
* setup the proper user
* check for os version compatiblity
* install the required software packages
* setup the cacti database and user
 * asks if you want to use an untouched cacti databse or a tweaked database that I use
  * you must use the untouched database if you are setting up a remote poller
* install cacti to the current production release
* install spine to the current production release

Once the installation has been done, you must complete the installation from the Cacti web gui.
After the gui install has been done, you must go to Utilities > System Utilities and select 'Rebuild Poller Cache' or you will see errors in the cacti log


### Issues
This is all still actively being worked on, so you may see changes to how things work and interact.
If you run into trouble with the script please <a href="https://github.com/KnoAll/cacti-template/issues">submit an issue</a> in the Github system above.
