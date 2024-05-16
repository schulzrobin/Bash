#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 
  exit 1
  else
	  #echo "Updating and Upgrading"
	  #apt-get update && apt-get upgrade -y
   
	  apt-get install dialog
	  cmd=(dialog --separate-output --checklist "Please Select Software you want to install:" 22 76 16)
	  options=(1 "Sublime Text 3" off    
	    2 "LAMP Stack" off
	    3 "Build Essentials" off
	    4 "Node.js" off
	    5 "Git" off)
     
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
