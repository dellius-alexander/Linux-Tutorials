#!/usr/bin/env bash
###############################################################################
###############################################################################
set -e
RED='\033[0;31m' # Red
NC='\033[0m' # No Color CAP
###############################################################################
    # Require sudo to run script
if [[ $UID != 0 ]]; then
    printf "\nPlease run this script with sudo: \n";
    printf "\n${RED} sudo $0 $* ${NC}\n\n";
    exit 1
fi
###############################################################################
#
# Install Docker
#
# Update the apt package index and install packages to allow apt to 
# use a repository over HTTPS:
apt-get update 
wait $!
#
wait $!
apt-get install \
apt-transport-https \
ca-certificates \
curl \
gnupg-agent \
software-properties-common
wait $!
#
# Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#
apt-key fingerprint 0EBFCD88
#
add-apt-repository \
"deb [arch=arm64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"
wait $!
#
apt-get update 
wait $!
#
apt-get install docker-ce docker-ce-cli containerd.io
wait $!
#
docker run hello-world
wait $!
#####################################################################
# Install VSCode
apt-get install -y libxss1
wait $!
#
curl -L 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-arm64' -o code_1.53.2-1613044027_arm64.deb

# curl -L 'https://az764295.vo.msecnd.net/stable/622cb03f7e070a9670c94bae1a45d78d7181fbd4/code_1.53.2-1613044027_arm64.deb' -o 'code_1.53.2-1613044027_arm64.deb'
wait $!
dpkg -i code_1.53.2-1613044027_arm64.deb
#####################################################################