#!/usr/bin/env bash
set -e
RED='\033[0;31m' # Red
NC='\033[0m' # No Color CAP
###############################################################################
# Require to run script
#
if [[ $UID != 0 ]]; then
    printf "\nPlease run this script with sudo: \n";
    printf "\n${RED} $0 $* ${NC}\n\n";
    exit 1
fi
###############################################################################
# Get & validate current user
#
printf "\n\n"
echo -n "Enter current user: "
read usr
while [ $(cat /etc/passwd | grep -c "${usr}") -eq 0 ]; do
    if [ $(echo ${usr} | grep -ic "exit") -eq 1 ]; then
    exit 0
    fi
    printf "\n${RED}Sorry I was unable to locate user account: [ ${usr} ].\n \
    Please re-enter username or type \"exit\" ${NC}\n\n"
    echo "Enter current user: "
    read usr
done
printf "\n${usr}\n"
##########################################################################
# Install Docker
# ***** I had issues installing docker the conventional method via apt
#       so i opted to install from a package *****
#
apt-get install -y apt-transport-https ca-certificates gnupg-agent
#
if [[ $(command -v docker | grep -c "docker") -eq 0 ]]; then
#
cd /tmp
#
curl -L https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/docker-ce-cli_20.10.4~3-0~ubuntu-bionic_amd64.deb \
-o docker-ce-cli_20.10.4~3-0~ubuntu-bionic_amd64.deb && \
dpkg -i docker-ce-cli_20.10.4~3-0~ubuntu-bionic_amd64.deb
wait $!
rm docker-ce-cli_20.10.4~3-0~ubuntu-bionic_amd64.deb
#
curl -L https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/containerd.io_1.4.3-1_amd64.deb \
-o containerd.io_1.4.3-1_amd64.deb && \
dpkg -i containerd.io_1.4.3-1_amd64.deb
wait $!
rm containerd.io_1.4.3-1_amd64.deb
#
curl -L https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/docker-ce_20.10.4~3-0~ubuntu-bionic_amd64.deb \
-o docker-ce_20.10.4~3-0~ubuntu-bionic_amd64.deb && \
dpkg -i docker-ce_20.10.4~3-0~ubuntu-bionic_amd64.deb 
wait $!
rm docker-ce_20.10.4~3-0~ubuntu-bionic_amd64.deb 
#
curl -L https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/docker-ce-rootless-extras_20.10.4~3-0~ubuntu-bionic_amd64.deb \
-o docker-ce-rootless-extras_20.10.4~3-0~ubuntu-bionic_amd64.deb && \
dpkg -i docker-ce-rootless-extras_20.10.4~3-0~ubuntu-bionic_amd64.deb
wait $!
rm docker-ce-rootless-extras_20.10.4~3-0~ubuntu-bionic_amd64.deb
# Setup bash completion for docker
curl -L https://raw.githubusercontent.com/docker/compose/1.28.5/contrib/completion/bash/docker-compose \
-o /etc/bash_completion.d/docker-compose
fi
# Test docker is working
docker run hello-world
wait $!
# Add docker user
printf "\n\n${RED}Note:${NC}\n"
printf "\nRun the below to add user to docker group:\n"
printf "\n\t${RED}sudo usermod -aG docker ${usr}${NC}\n"
printf "\n\t${RED}newgrp docker ${usr}${NC}\n"
wait $!
sleep 10
#
exit 0
