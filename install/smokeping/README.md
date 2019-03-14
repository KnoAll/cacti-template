# SmokePing install
:warning: **[This assumes you have ALREAY installed cacti via the install script] If you have installed SmokePing or any other software via your own method or adjusted the OS this will break your install!! :warning:

As of the writing of this script, the current SmokePing release is v2.7.3. I will keep this script updated to follow the official SmokePing releases, and you can use the cacti-upgrade.sh moving forward.


## Issues
This is all still actively being worked on, so you may see changes to how things work and interact.
If you run into trouble with the script please <a href="https://github.com/KnoAll/cacti-template/issues">submit an issue</a> in the Github system above.
[GitHub Issues](issues/)

## Initial install Setup Instructions

Based on a clean Centos7 Minimal or Raspian Stretch Lite default install. This has been developed on a RasperryPi 3 B+. As SmokePing is a very sensetive monitoring tool I highly recomend only using ethernet for the best reliability. I reccomend against running on a Pi Zero W as the cpu power is half that of the 3 B+.

#### Centos7 specific requirements: You must have already setup a 'cacti' user with sudoer rights. This script will kick out if not running under that user.

#### Raspian specific requirements: You must run this as the default 'pi' user. This script will kick out if not running under that user.

Run this from the command line...
```bash
bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/master/install/smokeping/install.sh)
```

Subsequent updates can be run by simply 
```bash
./cacti-upgrade
```
from the cacti user's home directory.

The script will:
* check for os version compatiblity
* setup the proper user
* install the required software packages
* install SmokePing to the current production release
