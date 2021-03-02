# elementary OS Juno post install

# first step, upgrade
sudo apt update && sudo apt upgrade

sudo apt install ubuntu-restricted-extras
sudo apt install software-properties-common --no-install-recommends
sudo apt install libavcodec-extra ffmpeg
sudo apt install firefox vlc
sudo apt install screenfetch flameshot
sudo apt install audacious audacious-plugins
sudo apt install rar unrar zip unzip xz-utils p7zip-full p7zip-rar sharutils file-roller
sudo apt install synaptic gdebi dconf-editor
sudo apt install transmission-gtk
sudo apt install gparted filezilla
sudo apt install sqlite3
sudo apt install exfat-fuse exfat-utils
sudo apt install git gitk git-gui git-flow

# Set python 3.6.x as default.
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 17
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.6 9
sudo update-alternatives --config python
# and choose 3.6.9

sudo apt install python3-virtualenv python3-dev
sudo apt install build-essential
sudo apt install python3-pip

# elementary tweaks
sudo add-apt-repository ppa:philip.scott/elementary-tweaks
sudo apt-get update && sudo apt-get install elementary-tweaks

# battery
# optional ppa
sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get update

sudo apt-get install tlp tlp-rdw
sudo tlp start

# keepassxc
sudo add-apt-repository ppa:phoerious/keepassxc
sudo apt-get update
sudo apt-get install keepassxc

# sublime text 3
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

# Visual Studio Code
# more info https://code.visualstudio.com/docs/setup/linux
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code # or code-insiders

# Google Chrome stable
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update
sudo apt-get -y install google-chrome-stable

# Opera Browser
wget -qO - https://deb.opera.com/archive.key | sudo apt-key add -
sudo add-apt-repository 'deb https://deb.opera.com/opera-stable/ stable non-free'
sudo apt-get update
sudo apt-get install opera-stable

# netflix in opera
sudo apt-get install chromium-codecs-ffmpeg-extra
# last update 4.10.1582.2
# https://gist.github.com/ruario/3c873d43eb20553d5014bd4d29fe37f1

# spotify
# more info https://www.spotify.com/co/download/linux/
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client

# Insomnia Rest Client
# Add to sources
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list

# Add public key used to verify code signature
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
    | sudo apt-key add -

# Refresh repository sources and install Insomnia
sudo apt-get update
sudo apt-get install insomnia

# green-recorder
sudo add-apt-repository ppa:fossproject/ppa
sudo apt update
sudo apt install green-recorder

# nodeJS 10.x
wget -qO- https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs

# remote desktop client
sudo apt-get install remmina

# Google Drive client insync
echo "deb http://apt.insynchq.com/ubuntu bionic non-free contrib" | sudo tee /etc/apt/sources.list.d/insync.list
sudo apt-get update
sudo apt-get install insync

# grub customizer
sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo apt-get update
sudo apt-get install grub-customizer

# Wingpanel-indicator-ayatana
# more info http://entornosgnulinux.com/2018/08/15/como-instalar-wingpanel-indicator-ayatana-en-elementary-os-juno/
sudo add-apt-repository ppa:yunnxx/elementary
sudo apt update
sudo apt install indicator-application wingpanel-indicator-ayatana
# edit file 'indicator-application.desktop' in /etc/xdg/autostart/indicator-application.desktop
# and then add "Pantheon;" in "OnlyShowIn=Unity;GNOME;"
# log out and log back in to see the changes

# enable all Startup Applications
cd /etc/xdg/autostart
sudo sed --in-place 's/NoDisplay=true/NoDisplay=false/g' *.desktop

# disable single click in pantheon
gsettings set io.elementary.files.preferences single-click false

# accelerate startup
sudo mv /etc/xdg/autostart/at-spi-dbus-bus.desktop /etc/xdg/autostart/at-spi-dbus-bus.disabled

# update graphics drivers
sudo ubuntu-drivers devices
sudo ubuntu-drivers autoinstall

# fix samba
sudo chmod 744 /usr/lib/gvfs/gvfsd-smb-browse

# clean
sudo apt autoremove
sudo apt -y autoclean
sudo apt -y clean

# restart the system
sudo shutdown -r now

# some websites
#
# http://entornosgnulinux.com
# https://itsfoss.com/things-to-do-after-installing-ubuntu-18-04
# https://linuxconfig.org/how-to-install-the-nvidia-drivers-on-ubuntu-18-04-bionic-beaver-linux
# https://www.linuxslaves.com