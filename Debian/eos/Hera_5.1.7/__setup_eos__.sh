#!/usr/bin/env bash
###############################################################################
###############################################################################
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
###############################################################################
# Update the apt package index and install packages to allow apt to 
# use a repository over HTTPS:
#
apt-get update -y && apt-get upgrade -y
wait $!

#####################################################################
# Installs Packages
#
apt install -y curl ubuntu-restricted-extras && \
apt install -y software-properties-common --no-install-recommends && \
apt install -y libavcodec-extra ffmpeg && \
apt install -y firefox vlc && \
apt install -y screenfetch flameshot && \
apt install -y audacious audacious-plugins && \
apt install -y rar unrar zip unzip xz-utils p7zip-full p7zip-rar sharutils file-roller && \
apt install -y apt-xapian-index synaptic gdebi dconf-editor && \
apt install -y transmission-gtk && \
apt install -y gparted filezilla && \
#apt install -y sqlite3 && \
apt install -y exfat-fuse exfat-utils net-tools && \
apt install -y git gitk git-gui git-flow
wait $!
[ $? -ne 0 ] && printf "\n${RED}Something went wrong...\n\n${?}${NC}\n"
# Set python 3.6.x as default.
update-alternatives --install /usr/bin/python python /usr/bin/python2.7 18
update-alternatives --install /usr/bin/python python /usr/bin/python3.6 9
update-alternatives --config python
wait $!
[ $? -ne 0 ] && printf "\n${RED}Something went wrong...\n\n${?}${NC}\n"
# and choose 3.6.9

apt install -y python3-virtualenv python3-dev  && \
apt install -y build-essential && \
apt install -y python3-pip
wait $!
[ $? -ne 0 ] && printf "\n${RED}Something went wrong...\n\n${?}${NC}\n"
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
#
fi
# Test docker is working
docker run hello-world
wait $!
# Add docker user
printf "\n\n${RED}Note:${NC}\n"
printf "\nRun the below to add user to docker group:\n"
printf "\n\t${RED}sudo usermod -aG docker ${usr}${NC}\n"
printf "\n\t${RED}newgrp docker ${usr}${NC}\n\n"
read -n 1 -s -r -p "Press any key to continue"
wait $!
sleep 10
#
##########################################################################
# Install OBS:
#
#   OBS Studio is as much a broadcasting tool as it is a desktop recording 
#   tool. With OBS Studio, you can broadcast to YouTube, Smashcast, 
#   Mixer.com, DailyMotion, Facebook Live, Restream.io, LiveEdu.tv, 
#   Twitter, and more.  In fact, OBS Studio should seriously be considered 
#   the de facto standard for live broadcasting the Linux desktop.
#   See: https://obsproject.com/wiki/install-instructions#linux
apt install ffmpeg && \
add-apt-repository ppa:obsproject/obs-studio && \
apt-get update && \
apt-get install obs-studio
wait $!
[ $? -ne 0 ] && printf "\n${RED}Something went wrong...\n\n${?}${NC}\n"
##########################################################################
# sublime text 3
#
# See: https://www.sublimetext.com/docs/3/linux_repositories.html
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add - && \
apt-get install apt-transport-https && \
echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list && \
apt-get update && \
apt-get install -y sublime-text
wait $!
[ $? -ne 0 ] && printf "\n${RED}Something went wrong...\n\n${?}${NC}\n"
##########################################################################
# Visual Studio Code
#
# See: https://code.visualstudio.com/docs/setup/linux
wget -qO https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg && \
install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/ && \
sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] \
https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' && \
apt-get install -y apt-transport-https libxss1 && \
apt-get update && \
apt-get install code # or code-insiders
wait $!
[ $? -ne 0 ] && printf "\n${RED}Something went wrong...\n\n${?}${NC}\n"
#
#======================== Alternative Method =============================
# # Install VSCode
# #
# apt-get install -y libxss1
# wait $!
# # Download vscode package
# curl -L 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' \
# -o code_1.53.2-1613044664_amd64.deb
# wait $!
# # Install vscode deb package
# dpkg -i code_1.53.2-1613044027_arm64.deb
# wait $!
##########################################################################
# Google Chrome stable
#
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" \
| tee /etc/apt/sources.list.d/google-chrome.list && \
apt-get update && \
apt-get -y install google-chrome-stable
wait $!
[ $? -ne 0 ] && printf "\n${RED}Something went wrong...\n\n${?}${NC}\n"
##########################################################################
# # Install Opera Browser
# #
# wget -qO - https://deb.opera.com/archive.key | apt-key add - && \
# add-apt-repository 'deb https://deb.opera.com/opera-stable/ stable non-free' && \
# apt-get update && \
# apt-get install opera-stable

# # netflix in opera
# apt-get install chromium-codecs-ffmpeg-extra
# # last update 4.10.1582.2
# # https://gist.github.com/ruario/3c873d43eb20553d5014bd4d29fe37f1
#=========================================================================
# # Install Spotify plugin on Opera Browser:
# #
# #   See: https://www.spotify.com/us/download/linux/
# curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | apt-key add - 
# echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list
# apt-get update && apt-get install -y spotify-client
##########################################################################
# # Install Insomnia Rest Client
# #
# #   Insomnia is a free cross-platform desktop application that takes 
# #   the pain out of interacting with HTTP-based APIs. Insomnia combines 
# #   an easy-to-use interface with advanced functionality like 
# #   authentication helpers, code generation, and environment variables. 
# #   See: https://support.insomnia.rest/article/23-installation
# # Add to sources
# echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
#     | tee -a /etc/apt/sources.list.d/insomnia.list

# # Add public key used to verify code signature
# wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
#     | apt-key add -

# # Refresh repository sources and install Insomnia
# apt-get update
# apt-get install insomnia
##########################################################################
# Install nodeJS 15.x
#
# see: https://github.com/nodesource/distributions/blob/master/README.md
# Using Ubuntu
curl -fsSL https://deb.nodesource.com/setup_15.x | sudo -E bash - && \
apt-get install -y nodejs 
[ $? -ne 0 ] && printf "\n${RED}Something went wrong...\n\n${?}${NC}\n"
##########################################################################
# Install Remote desktop client
#
apt-get install -y remmina
wait $!
[ $? -ne 0 ] && printf "\n${RED}Something went wrong...\n\n${?}${NC}\n"
##########################################################################
# [Optional] 
# Google Drive client insync:
#
#   Manage your Google Drive & OneDrive files straight from your Desktop.
#   With Insync, you can now sync, edit, backup and share files without 
#   opening a million browser tabs.
#   See: https://help.insynchq.com/en/articles/2352071-linux-installation-guide
#
# echo "deb http://apt.insynchq.com/ubuntu bionic non-free contrib" | tee /etc/apt/sources.list.d/insync.list
# apt-get update
# apt-get install insync
##########################################################################
# Enable all Startup Applications
#
cd /etc/xdg/autostart
sed --in-place 's/NoDisplay=true/NoDisplay=false/g' *.desktop

# Disable single click in pantheon
#
gsettings set io.elementary.files.preferences single-click false

# Accelerate startup
#
mv /etc/xdg/autostart/at-spi-dbus-bus.desktop /etc/xdg/autostart/at-spi-dbus-bus.disabled
#
# Update graphics drivers
#
ubuntu-drivers devices
ubuntu-drivers autoinstall

# Fix samba
chmod 744 /usr/lib/gvfs/gvfsd-smb-browse

# Clean
apt autoremove
apt -y autoclean
apt -y clean

# Restart the system
shutdown -r now
