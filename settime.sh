#!/bin/bash

echo "Set Timezone to Europe/Zurich"
timedatecrl set-timezone europe/zurich

echo "Activate NTP Service"
timedate set-ntp=true

echo "Set IP to NTP-Client"
NTP=192.168.1.3 >> /etc/timedatectl.conf