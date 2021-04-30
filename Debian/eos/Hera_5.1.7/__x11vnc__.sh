#!/usr/bin/env bash

x11vnc -storepasswd 

echo "[Unit]" | tee /etc/systemd/system/x11vnc.service
echo "Description=\"x11vnc\"" | tee -a /etc/systemd/system/x11vnc.service
echo "Requires=display-manager.service" | tee -a /etc/systemd/system/x11vnc.service
echo "After=display-manager.service" | tee -a /etc/systemd/system/x11vnc.service
echo "" | tee -a /etc/systemd/system/x11vnc.service
echo "[Service]" | tee -a /etc/systemd/system/x11vnc.service
echo "ExecStart=/usr/bin/x11vnc -xkb -noxrecord -noxfixes -noxdamage -display :0 -auth guess -rfbauth /home/${whoami}/.vnc/passwd" | tee -a /etc/systemd/system/x11vnc.service
echo "ExecStop=/usr/bin/killall x11vnc" | tee -a /etc/systemd/system/x11vnc.service
echo "Restart=on-failure" | tee -a /etc/systemd/system/x11vnc.service
echo "RestartSec=2" | tee -a /etc/systemd/system/x11vnc.service
echo "" | tee -a /etc/systemd/system/x11vnc.service
echo "[Install]" | tee -a /etc/systemd/system/x11vnc.service
echo "WantedBy=multi-user.target" | tee -a /etc/systemd/system/x11vnc.service
echo "" | tee -a /etc/systemd/system/x11vnc.service


ufw allow 5900:5901/tcp

systemctl daemon-reload
systemctl start x11vnc.service
systemctl enable x11vnc.service



