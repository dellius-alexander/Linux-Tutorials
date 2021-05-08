# Setup Openvpn on LibreElec

```bash
# Download below to install from Repository OR
curl -fsSLo repository.zomboided.plugins-1.0.0.zip https://github.com/Zomboided/repository.zomboided.plugins/releases/download/1.0.0/repository.zomboided.plugins-1.0.0.zip
# Download the vpn manager directly and install
curl -fsSLo service.vpn.manager-6.4.2.zip https://github.com/Zomboided/service.vpn.manager/releases/download/6.4.2/service.vpn.manager-6.4.2.zip
```
When the vpn service launches for the first time you need for:

- [ExpressVPN](https://www.expressvpn.com/support/vpn-setup/manual-config-for-linux-ubuntu-with-openvpn/): (Expressvpn setup instructions for [openvpn](https://www.expressvpn.com/setup#manual))
    - Username: encrypted username
    - Password: encrypted password
    - Download Clent Zip file to get your:
        - client.crt
        - client.key
    - Download VPN Site .ovpn file for each vpn server you wish to connect to 
