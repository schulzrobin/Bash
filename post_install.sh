#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 
  exit 1
  else
   echo "Updating and Upgrading"
   apt-get update -y &> /dev/null
   echo "Updated successfully"
   apt-get upgrade -y &> /dev/null
   echo "Upgraded successfully"
   echo "Install dialog"
   apt-get install -y dialog &> /dev/null
   cmd=(dialog --title "Robins Helper Script --separate-output --checklist "Treffe die auswahl, was installiert werden soll:" 22 76 16)
   options=(1 "Change motd" off    
	    2 "Set NTP" off
	    3 "Backup Script" off
      4 "Apache2" off
	    5 "LAMPP" off
	    6 "Docker" off
      7 "Java JDK" off
      8 "" off
      9 "Webmin" off
      10 "Grafana" off
      11 "InfluxDB" off
      12 "NodeRed" off)

   choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
   clear
   for choice in $choices
   do
   case $choice in
    1)
     echo "Downloading motd script"
     wget https://githubusercontent.com/schulzrobin/Bash/tree/main/motd.sh
     echo "Make file executable"
     chmod +x motd.sh
     echo "Run motd.sh"
     ./motd.sh
     ;;

    2)
     echo "Downloading NTP script"
     ;;

    3)
     echo "Installing Build Essentials"
     ;;

    4)
     echo "Installing Nodejs"
     ;;

    5)
     echo "Installing Git, please congiure git later..."
     ;;
   esac
  done
fi
