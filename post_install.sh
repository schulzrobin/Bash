#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 
  exit 1
  else
   echo "Updating and Upgrading"
   apt-get update && apt-get upgrade -y
   apt-get install dialog
   cmd=(dialog --title "Robins Helper Script --separate-output --checklist "Treffe die auswahl, was installiert werden soll:" 22 76 16)
   options=(1 "Change motd" off    
	    2 "Set NTP" off
	    3 "Apache2" off
	    4 "LAMPP" off
	    5 "Docker" off
     6 "Java JDK" off
     7 "Backup Script" off)

   choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
   clear
   for choice in $choices
   do
   case $choice in
    1)
     echo "Installing Sublime Text"
     add-apt-repository ppa:webupd8team/sublime-text-3 -y
     apt update
     apt install sublime-text-installer -y
     ;;

    2)
     echo "Installing Apache"
     apt install apache2 -y
     echo "Starting Apache Server"
     service apache2 start
     ;;

    3)
     echo "Installing Build Essentials"
     apt install -y build-essential
     ;;

    4)
     echo "Installing Nodejs"
     curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
     apt install -y nodejs
     ;;

    5)
     echo "Installing Git, please congiure git later..."
     apt install git -y
     ;;
   esac
  done
fi
