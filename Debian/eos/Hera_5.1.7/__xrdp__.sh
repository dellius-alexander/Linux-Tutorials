
#!/usr/bin/env bash
#https://github.com/microsoft/linux-vm-tools/blob/master/ubuntu/18.04/install.sh
#
# This script is for Ubuntu 18.04 Bionic Beaver to download and install XRDP+XORGXRDP via
# source.
#
# Major thanks to: http://c-nergy.be/blog/?p=11336 for the tips.
#

###############################################################################
# Use HWE kernel packages
#
#HWE=""
HWE="-hwe-18.04"
# Desktop Name:
# Check the name of the ${DESKTOP_SESSION} environment variable...
DESKTOP="${DESKTOP_SESSION}"
echo "${DESKTOP}"

###############################################################################
# Update our machine to the latest code if we need to.
#

if [ "$(id -u)" -ne 0 ]; then
    echo 'This script must be run with root privileges' >&2
    exit 1
fi

apt update && apt upgrade -y

if [ -f /var/run/reboot-required ]; then
    echo "A reboot is required in order to proceed with the install." >&2
    echo "Please reboot and re-run this script to finish the install." >&2
    exit 1
fi
###############################################################################
# Setup hyper-v settings modules by edit the “modules” file located in 
#     /etc/initramfs-tools
# Microsoft provides Linux Integration Services (LIS), which are 
#     basically Microsoft’s version of VMware Tools.
if [ $(systemd-detect-virt) == 'microsoft' ]; then
cat >>/etc/initramfs-tools/modules<<EOF
hv_vmbus
hv_storvsc
hv_blkvsc
hv_netvsc
EOF
fi
###############################################################################
# XRDP
#

# Install hv_kvp utils
apt install -y linux-virtual
apt install -y linux-tools-virtual${HWE}
apt install -y linux-cloud-tools-virtual${HWE}

# Install the xrdp service so we have the auto start behavior
apt install -y xrdp

systemctl stop xrdp
systemctl stop xrdp-sesman

# Configure the installed XRDP ini files.
# use vsock transport.
sed -i_orig -e 's/use_vsock=false/use_vsock=true/g' /etc/xrdp/xrdp.ini
# use rdp security.
sed -i_orig -e 's/security_layer=negotiate/security_layer=rdp/g' /etc/xrdp/xrdp.ini
# remove encryption validation.
sed -i_orig -e 's/crypt_level=high/crypt_level=none/g' /etc/xrdp/xrdp.ini
# disable bitmap compression since its local its much faster
sed -i_orig -e 's/bitmap_compression=true/bitmap_compression=false/g' /etc/xrdp/xrdp.ini

# Add script to setup the ubuntu session properly
if [ ! -e /etc/xrdp/start${DESKTOP}.sh ]; then
cat >> /etc/xrdp/start${DESKTOP}.sh << EOF
#!/bin/sh
export GNOME_SHELL_SESSION_MODE=${DESKTOP}
export XDG_CURRENT_DESKTOP=${DESKTOP}:GNOME
exec /etc/xrdp/startwm.sh
EOF
chmod a+x /etc/xrdp/start${DESKTOP}.sh
fi

# use the script to setup the ubuntu session
sed -i_orig -e 's/startwm/startpantheon/g' /etc/xrdp/sesman.ini

# rename the redirected drives to 'shared-drives'
sed -i -e 's/FuseMountName=thinclient_drives/FuseMountName=shared-drives/g' /etc/xrdp/sesman.ini

# Changed the allowed_users
sed -i_orig -e 's/allowed_users=console/allowed_users=anybody/g' /etc/X11/Xwrapper.config

# Blacklist the vmw module
if [ ! -e /etc/modprobe.d/blacklist_vmw_vsock_vmci_transport.conf ]; then
cat >> /etc/modprobe.d/blacklist_vmw_vsock_vmci_transport.conf <<EOF
blacklist vmw_vsock_vmci_transport
EOF
fi

#Ensure hv_sock gets loaded
if [ ! -e /etc/modules-load.d/hv_sock.conf ]; then
echo "hv_sock" > /etc/modules-load.d/hv_sock.conf
fi

# Configure the policy xrdp session
cat > /etc/polkit-1/localauthority/50-local.d/45-allow-colord.pkla <<EOF
[Allow Colord all Users]
Identity=unix-user:*
Action=org.freedesktop.color-manager.create-device;org.freedesktop.color-manager.create-profile;org.freedesktop.color-manager.delete-device;org.freedesktop.color-manager.delete-profile;org.freedesktop.color-manager.modify-device;org.freedesktop.color-manager.modify-profile
ResultAny=no
ResultInactive=no
ResultActive=yes
EOF

# reconfigure the service
systemctl daemon-reload
systemctl start xrdp

#
# End XRDP
###############################################################################
# update boot image
update-initramfs -u

echo "Install is complete."
echo "Reboot your machine to begin using XRDP."