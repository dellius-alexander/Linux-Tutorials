#!/usr/bin/env bash
###############################################################################
###############################################################################
set -e
__USER__=""
__USR_HME__=""
###############################################################################
__usr_hme__(){
__USR_HME__=""
while true; do
read -p 'Enter username: ' v
if [ ${#__USR_HME__} -eq 0 ]; then        
    # check for user home directory
    dir_=$(getent passwd | grep -i "$v" | cut -d ':' -f6)
    if [ ${#dir_} -ne 0 ];  then
        __USR_HME__=${dir_}
        echo ${__USR_HME__}
        sleep 3
        break
    else
        __USR_HME__=""
        echo "Your entry is not a directory..."
        sleep 3
    fi
fi
done
}   # End of __usr_hme__

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
apt install -y libreoffice-common && \
#apt install -y sqlite3 && \
apt install -y exfat-fuse exfat-utils net-tools && \
apt install -y qml-module-qtquick2 qml-module-qtquick-controls2 \
qml-module-qtquick-layouts qml-module-qtquick-templates2 \
qml-module-qtquick-window2 qml-module-qtgraphicaleffects 
curl -L https://downloads.raspberrypi.org/imager/imager_1.5_amd64.deb -o /tmp/imager_1.5_amd64.deb
apt install -y libqt5quicktemplates2-5 libqt5quickcontrols2-5 \
qml-module-qtquick2 qml-module-qtquick-controls2 \
qml-module-qtquick-layouts qml-module-qtquick-templates2 \
qml-module-qtquick-window2 qml-module-qtgraphicaleffects && \
dpkg -i /tmp/imager_1.5_amd64.deb && rm  /tmp/imager_1.5_amd64.deb
apt install -y git gitk git-gui git-flow
wait $!
# android CLI tools dependencies
apt-get install -y autoconf build-essential curl default-jdk gawk git gperf lib32stdc++6 lib32z1 lib32z1-dev libcurl4-openssl-dev unzip zlib1g-dev
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
# Install Express VPN
mkdir -p /tmp/expvpn
cd /tmp/expvpn
gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 0xAFF2A1415F6A3A38 &&
curl -fsSL https://www.expressvpn.com/expressvpn_release_public_key_0xAFF2A1415F6A3A38.asc -o /tmp/expvpn/expressvpn_release_public_key_0xAFF2A1415F6A3A38.asc &&
gpg --import expressvpn_release_public_key_0xAFF2A1415F6A3A38.asc &&
gpg --fingerprint release@expressvpn.com &&
curl -fsSL https://www.expressvpn.works/clients/linux/expressvpn_3.6.0.70-1_amd64.deb.asc -o /tmp/expvpn/expressvpn_3.6.0.70-1_amd64.deb.asc &&
curl -fsSL https://www.expressvpn.works/clients/linux/expressvpn_3.6.0.70-1_amd64.deb -o /tmp/expvpn/expressvpn_3.6.0.70-1_amd64.deb

if [[ $? == 0 ]]; then
    gpg --verify expressvpn_3.6.0.70-1_amd64.deb.asc && \
    [[ $?  == 0 ]] && \
    dpkg -i /tmp/expvpn/expressvpn_3.6.0.70-1_amd64.deb
else
    echo "Their was an error verifying signature..."
    exit 1
fi
cd /tmp
rm -rf /tmp/expvpn
printf "\n\n${RED}Goto https://www.expressvpn.com/setup#linux and login to retrieve your activation code to complete installation.\n\nWant a graphical interface?\n
Control ExpressVPN with our browser extension, which protects your whole device.\n\n
For Chrome, run “expressvpn install-chrome-extension”.\n
For Firefox, run “expressvpn install-firefox-extension”.${NC}\n\n"
expressvpn activate
wait $!
##########################################################################
# Install sdkmanager command line tool for android studios
[ ! -d "~/android-tools/android-sdk-linux/cmdline-tools" ] && mkdir -p ~/android-tools/android-sdk-linux &>/dev/null
#
# Dependencies: 
apt-get install -y autoconf build-essential curl default-jdk gawk \
git gperf lib32stdc++6 lib32z1 lib32z1-dev libcurl4-openssl-dev unzip \
zlib1g-dev
#
# Install SDK Command line tools
_sha256checksum_cli="^(87f6dcf41d4e642e37ba03cb2e387a542aa0bd73cb689a9e7152aad40a6e7a08)?$"
curl -fsSL https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip \
-o $HOME/Downloads/commandlinetools-linux-6858069_latest.zip
wait $!
_verify_sha256checksum_cli="$(sha256sum ~/Downloads/commandlinetools-linux-6858069_latest.zip | cut -d ' ' -f-1)"
if [ ${_verify_sha256checksum_cli} =~ ${_sha256checksum_cli} ]; then
    printf "\n\nChecksum verified...\n\nSafe to use cmdline-tools...\n\n" 
    unzip -o $HOME/Downloads/commandlinetools-linux-6858069_latest.zip \
    -d /usr/local/etc/android-tools/android-sdk-linux/
else
    printf "\n\nChecksum verification failed......\n\n"
fi
chown dalexander:dalexander -R ~/android-tools
apt-get update -y && \
apt-get upgrade -y
wait $!
ln -s /usr/local/etc/android-tools/android-sdk-linux/cmdline-tools/bin/* /usr/local/bin
rm -rf ~/Downloads/commandlinetools-linux-6858069_latest.zip

# # Install Android studio's
# _sha256checksum_studio="^(f599749ca47cda06d392e2764017c8a8a0c7b963a6a88ed494b432bece7cbc1b)?$"
# curl -fsSL https://redirector.gvt1.com/edgedl/android/studio/ide-zips/4.1.3.0/android-studio-ide-201.7199119-linux.tar.gz -o $HOME/Downloads/android-studio-ide-201.7199119-linux.tar.gz 
# wait $! 
# _verify_sha256checksum_studio=$(sha256sum $HOME/Downloads/android-studio-ide-201.7199119-linux.tar.gz | cut -d " " -f-1)
# if [ ${_verify_sha256checksum_studio} =~ ${_sha256checksum_studio} ]; then
#     printf "\n\nChecksum verified...\n\nSafe to use Android Studios...\n\n"
#     tarz -tvf  $HOME/Downloads/android-studio-ide-201.7199119-linux.tar.gz 
# else
#     printf "\n\nChecksum verification failed......\n\n" 
# fi
# # docker load -i ./android-studio-ide-201.7199119-linux.tar.gz 
#
# Install Platform tools
# TODO: finish installation script
#https://dl.google.com/android/repository/platform-tools-latest-linux.zip
#
##########################################################################
# Verify & setup swap partition to persist crashes
# if swap exists & resume file exists
if [ $(blkid | grep -ic "swap") == 1 ] && [ -e "/etc/initramfs-tools/conf.d/resume" ]; then
    if [ $(cat "/etc/initramfs-tools/conf.d/resume" | grep -i "RESUME" | cut -d "=" -f3) = $(blkid | awk -F\" '/swap/ {print $2}') ]; then
        printf "\n\nSwap partition is setup......\n\n"
    else
        printf "\nRESUME=UUID=$(blkid | awk -F\" '/swap/ {print $2}')\n" >> /etc/initramfs-tools/conf.d/resume
        update-initramfs -u -k all  # update initramfs so it loads swap at boot
        wait $!
    fi
# if swap exists & resume file not exist
elif [ $(blkid | grep -ic "swap") == 1 ] && [ ! -e "/etc/initramfs-tools/conf.d/resume" ]; then
    printf "RESUME=UUID=$(blkid | awk -F\" '/swap/ {print $2}')\n" | sudo tee /etc/initramfs-tools/conf.d/resume
    update-initramfs -u -k all  # update initramfs so it loads swap at boot
    wait $!
else
    echo "No swap found..."
# if their is not swap then do nothing else...
fi
# Adjusting the Swappiness Value #

# Swappiness is a Linux kernel property that defines how often the system 
# will use the swap space. Swappiness can have a value between 0 and 100. 
# A low value will make the kernel to try to avoid swapping whenever 
# possible, while a higher value will make the kernel to use the swap 
# space more aggressively.

# The default swappiness value is 60. You can check the current swappiness 
# value by typing the following command: (60 is OK for most Linux systems; 
# 10 is ok for production servers)
#cat /proc/sys/vm/swappiness
#
# To set the swappiness value to 10, run:
#sysctl vm.swappiness=10

# To make this parameter persistent across reboots, append the following 
# line to the /etc/sysctl.conf file: [ vm.swappiness=10 ]

##################################################################################
##################################################################################
set -e
# Install Cypress Locally
HOME="/home/dalexander"
USER="dalexander"
##################################################################################
cd $HOME/Downloads
# create installation directory for cypress and custom cache location 
mkdir -p $HOME/cypress_projects &>/dev/null &&
mkdir -p $HOME/cypress_projects/.cache &>/dev/null &&
export NODEJS_HOME="/usr/local/share/node-v14.16.0-linux-x64/bin/"
export CYPRESS_CACHE_FOLDER="$HOME/cypress_projects/.cache"
export CYPRESS_PROJECT_DIR="$HOME/cypress_projects/"
echo $CYPRESS_CACHE_FOLDER
export $CYPRESS_PROJECT_DIR
echo $NODEJS_HOME
export OLD_PATH=$PATH

# install dependencies
apt-get install -y libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev \
libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb 

#cd $HOME/Downloads
# download, unzip and move node to /usr/local/share directory
echo "Downloading nodejs......"
sleep 3
curl -fsSL https://nodejs.org/dist/v14.16.0/node-v14.16.0-linux-x64.tar.xz \
-o $HOME/Downloads/node-v14.16.0-linux-x64.tar.xz &&

# xz -dv ~/Downloads/node-v14.16.0-linux-x64.tar.xz ~/Downloads/node-v14.16.0-linux-x64.tar
echo "moving node to /usr/local/share......"
sleep 3
tar -xvf $HOME/Downloads/node-v14.16.0-linux-x64.tar.xz -C /usr/local/share/ 

echo
echo "Setting up node to persist reboots......"
sleep 3
# Add node to PATH
node_env=$(cat $HOME/.bash_aliases | grep -ic "NODEJS_HOME" )
if [ $node_env -gt 1 ]; then
  # persist reboots
  cat >>$HOME/.bash_aliases<<EOF
#####################################################################
#####################################################################
#########################  NodeJS Binaries  #########################
# NodeJS
export NODEJS_HOME="/usr/local/share/node-v14.16.0-linux-x64/bin/"
export CYPRESS_CACHE_FOLDER="$HOME/cypress_projects/cypress_cache npm install"

EOF
# setup cypress project config file
fi
#
#

  echo "Setting up cypress environment......"
  cat >$CYPRESS_PROJECT_DIR/cypress.json<<EOF
  {
      "baseUrl": "https://dellius-alexander.github.io/responsive_web_design/",
      "env": {
          "CYPRESS_CACHE_FOLDER": "~/cypress/cypress_cache npm install"
      },
      "pageLoadTimeout": 60000,
      "viewportWidth": 1920,
      "viewportHeight": 1080
  }
EOF
#
  # project global configurations file
  cat >$CYPRESS_PROJECT_DIR/package.json <<EOF
  {
    "name": "cypress-test-suite-demo",
    "description": "Example full e2e test code coverage.",
    "scripts": {
      "cypress:open": "cypress open",
      "cypress:run": "cypress run"
    },
    "devDependencies": {
      "cypress": "^6.8.0"
    },
    "license": "MIT"
  }
EOF
  echo "Home Directory: $HOME"
  cd $CYPRESS_PROJECT_DIR
  sleep 3
  echo "Location of cypress install location: $CYPRESS_PROJECT_DIR"
  printf "\n\n"
  echo "Installing Cypress....."
  # verify node added to path
  if [ $(echo ${PATH} | grep -ic 'node-v14.16.0-linux-x64') -eq 0 ]; then
    export PATH="$NODEJS_HOME:$PATH"
  fi
  sleep 2
  npm i -D cypress  
  sleep 2
  npm i -D cypress-xpath
  sleep 2
  wait $!
  if [ -f 'cypress/support/index.js' ]; then
cat >>cypress/support/index.js<<EOF
// -----------------------------------------------------------
//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////
// Install cypress-xpath
///////////////////////////////
// w: npm install -D cypress-xpath
// w: yarn add cypress-xpath --dev
// Then include in your project's cypress/support/index.js
require('cypress-xpath')
EOF
fi
# Take ownership of the project folder
chown $USER:$USER -R $CYPRESS_PROJECT_DIR
rm $HOME/Downloads/node-v14.16.0-linux-x64.tar.xz
##########################################################################
# Setup/update drivers automatically
if [ $(ubuntu-drivers devices | grep -ic 'recommended') -gt 0 ]; then
    ubuntu-drivers autoinstall
fi
##########################################################################
# Enable all Startup Applications
#
cd /etc/xdg/autostart
sed --in-place 's/NoDisplay=true/NoDisplay=false/g' *.desktop
##########################################################################
# Disable single click in pantheon
#
gsettings set io.elementary.files.preferences single-click false
##########################################################################
# Accelerate startup
#
mv /etc/xdg/autostart/at-spi-dbus-bus.desktop /etc/xdg/autostart/at-spi-dbus-bus.disabled
##########################################################################

##########################################################################
# Fix samba
chmod 744 /usr/lib/gvfs/gvfsd-smb-browse
##########################################################################
# Clean
apt autoremove
apt -y autoclean
apt -y clean

# Restart the system
shutdown -r now
