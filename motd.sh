#!/bin/bash
source <(curl -s https://raw.githubusercontent.com/schulzrobin/Bash/main/misc/helper.func)
# Copyright (c) 2024 schulzrobin
# Author: schulzrobin (Robin Schulz)
# https://robn.ch/l

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 
  exit 1
  else

function installsw() {
 echo "Installing Screenfetch"
 apt-get install -y screenfetch >/dev/null
 echo "Screenfetch successfully installed"
 echo "Installing Inxi"
 apt-get install -y inxi >/dev/null
 echo "Inxi successfully installed"
}

function motdfile() {
 echo "Disable current scripts"
 chmod -x /etc/update-motd.d/*
 echo "Scripts disabled"

 echo "Download custom motd file"
 wget -q https://raw.githubusercontent.com/schulzrobin/Bash/main/01-custom -O /etc/update-motd.d/01-custom
 echo "motd file successfully downloaded"
 echo "make file executable"
 chmod +x /etc/update-motd.d/01-custom
}


installsw
motdfile

echo "Motd successfully changed. Re-login for activation"

fi
exit
