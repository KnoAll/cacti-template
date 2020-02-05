#!/bin/bash
scriptver=v1.2.8
case $(whoami) in
	root)
		echo -e "\033[31m You ran me as root! Do not run me as root!"
		echo -e -n "\033[0m"
		exit 1
	;;
	cacti)
	;;
	*)
		echo -e "\033[31m Uh-oh. You are not logged in as the cacti user. Exiting..."
		echo -e -n "\033[0m"
		exit
	;;
esac

green=$(tput setaf 2)
red=$(tput setaf 1)
tan=$(tput setaf 3)
reset=$(tput sgr0)

welcomeMessage() {
  echo -n "${tan}"
  cat << "EOF"

        CCCCCCCCCCCCC                                              tttt            iiii
     CCC::::::::::::C                                           ttt:::t           i::::i
   CC:::::::::::::::C                                           t:::::t            iiii
  C:::::CCCCCCCC::::C                                           t:::::t
C:::::C       CCCCCC  aaaaaaaaaaaaa      ccccccccccccccccttttttt:::::ttttttt    iiiiiii
C:::::C                a::::::::::::a   cc:::::::::::::::ct:::::::::::::::::t    i:::::i
C:::::C                aaaaaaaaa:::::a c:::::::::::::::::ct:::::::::::::::::t     i::::i
C:::::C                         a::::ac:::::::cccccc:::::ctttttt:::::::tttttt     i::::i
C:::::C                  aaaaaaa:::::ac::::::c     ccccccc      t:::::t           i::::i
C:::::C                aa::::::::::::ac:::::c                   t:::::t           i::::i
C:::::C               a::::aaaa::::::ac:::::c                   t:::::t           i::::i
C:::::C       CCCCCCa::::a    a:::::ac::::::c     ccccccc      t:::::t    tttttt i::::i
  C:::::CCCCCCCC::::Ca::::a    a:::::ac:::::::cccccc:::::c      t::::::tttt:::::ti::::::i
   CC:::::::::::::::Ca:::::aaaa::::::a c:::::::::::::::::c      tt::::::::::::::ti::::::i
     CCC::::::::::::C a::::::::::aa:::a cc:::::::::::::::c        tt:::::::::::tti::::::i
        CCCCCCCCCCCCC  aaaaaaaaaa  aaaa   cccccccccccccccc          ttttttttttt  iiiiiiii


EOF
  echo -n "${reset}"
  echo "Welcome to the Kevin's Cacti script!"
  echo
}

case $1 in
	dev)
		echo -e "\033[31m Switching to DEV script..."
		echo -e -n "\033[0m"
		bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/dev/upgrade-cacti.sh) $1 $2
	;;
	--fix-permissions)
		welcomeMessage
		counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=update-permissions&write=0 )
		bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/master/update-permissions.sh) $1 $2
	;;
	--backup-data)
		welcomeMessage
		counter=$( curl -s http://www.kevinnoall.com/cgi-bin/counter/unicounter.pl?name=backup-data&write=0 )
		bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/master/backup-cacti.sh) $1 $2
	;;
	--restore-data)
		welcomeMessage
		bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/master/restore-cacti.sh) $1 $2
	;;
	*)
		welcomeMessage
		bash <(curl -s https://raw.githubusercontent.com/KnoAll/cacti-template/master/upgrade-cacti.sh) $1 $2
	;;
esac
