# SmokePing install
Please visit [SmokePing installation script](smokeping) to install SmokePing

# Cacti network grapher installation
:warning: **[This assumes you have a brand-new, clean, un-used/updated version of CentOS7 Minimal or Raspian Stretch Lite.] You must not have made any changes to the OS. If you have installed Cacti or any other software via your own method or adjusted the OS this will break your Cacti install!! :warning:

As of the writing of this script, the current cacti release is v1.2.1. I will keep this script updated to follow the official Cacti releases, and you can use the cacti-upgrade.sh moving forward.


## Issues
This is all still actively being worked on, so you may see changes to how things work and interact.
If you run into trouble with the script please [submit an issue](../../../../issues/) in the Github system above.


## Initial install Setup Instructions

Based on a clean Centos7 Minimal or Raspian Stretch Lite default install. This has been developed on a RasperryPi 3 B+. As Cacti is a monitoring tool I highly recomend only using ethernet for the best reliability. I reccomend against running on a Pi Zero W as the cpu power is half that of the 3 B+.

#### Centos7 specific requirements: You must have already setup a 'cacti' user with sudoer rights. This script will kick out if not running under that user.

#### Raspian specific requirements: You must run this as the default 'pi' user. This script will kick out if not running under that user.

Run this from the command line...
```bash
bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/master/install/install.sh)
```

Subsequent updates can be run by simply 
```bash
./cacti-upgrade
```
from the cacti user's home directory.

The script will:
* check for os version compatiblity
* download the cacti-upgrade.sh script
* setup the proper user
* install the required software packages
* setup the cacti database and user
 * asks if you want to use an untouched cacti databse or a tweaked database that I use
  * you must use the untouched database if you are setting up a remote poller
* install cacti to the current production release
* install spine to the current production release

The install has to setup matching timezone information for OS/PHP/MYSQL, so it will stomp on anything you might have setup originally. Apologies for this, you will have to change it back to wherever you are after install.

Once the installation has been done, you must complete the installation from the Cacti web gui.
After the gui install has been done, you must go to Utilities > System Utilities and select 'Rebuild Poller Cache' or you will see errors in the cacti log
