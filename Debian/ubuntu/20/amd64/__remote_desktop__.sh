#!/usr/bin/env bash
#####################################################################
    # Require sudo to run script
if [[ $UID != 0 ]]; then
    printf "\nPlease run this script with sudo: \n";
    printf "\n${RED} sudo $0 $* ${NC}\n\n";
    exit 1
fi
#####################################################################
#####################################################################
# Install & Setup Remote Desktop Connection
#####################################################################
# Remote Desktop Ubuntu
apt-get install -y xrdp && \
systemctl status xrdp && \
adduser xrdp ssl-cert && \
systemctl restart xrdp && \
ufw allow 3389
#
if [ $? == 0 ]; then 
    printf "\nSomething went wrong installing Remote Desktop...\n"
fi