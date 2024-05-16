#!/bin/bash
source <(curl -s https://raw.githubusercontent.com/schulzrobin/Bash/main/misc/helper.func)
# Copyright (c) 2024 schulzrobin
# Author: schulzrobin (Robin Schulz)
# https://robn.ch/l

function header_info {
clear
cat <<"EOF"
                    __      __
   ____ ___  ____  / /_____/ /
  / __  __ \/ __ \/ __/ __  / 
 / / / / / / /_/ / /_/ /_/ /  
/_/ /_/ /_/\____/\__/\__,_/   
                                                                                        
 
EOF
}
header_info

function mod_file() {
msg_info "Disable current scripts"
chmod -x /etc/upate-motd.d/*
msg_ok "Scripts disabled"

msg_info "Create new motd file"

# CODE TO GENERATE FILE

msg_ok "motd file successfully created"

msg_info "make file executable"
chmod +x /etc/update-motd.d/01-custom

exit
}

function install() {
header_info
if [[ ! dpkg -s screenfetch &> /dev/null ]]; then
 msg_error "Screenfetch is not installed!"
 echo "Installing Screenfetch"
 apt install -y screenfetch >/dev/null 2>&1
 msg_ok "Screenfetch successfully installed"
fi
if [[ ! dpkg -s inxi &> /dev/null ]]; then
 msg_error "Inxi is not installed!"
 echo "Installing Inxi"
 apt install -y inxi >/dev/null 2>&1
 msg_ok "Inxi successfully installed"
fi
exit
}

install
