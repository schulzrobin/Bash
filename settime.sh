#!/bin/bash

echo "Set Timezone to Europe/Zurich"
timedatectl set-timezone europe/zurich

echo "Activate NTP Service"
timedatectl set-ntp on

echo "Set IP to NTP-Client"
echo "NTP=192.168.1.3" >> /etc/timedatectl.conf