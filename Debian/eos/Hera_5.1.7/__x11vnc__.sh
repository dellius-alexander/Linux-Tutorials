#!/usr/bin/env bash

x11vnc -storepasswd 
cat >/etc/systemd/system/x11vnc.service <<EOF
[Unit]
Description="x11vnc"
Requires=display-manager.service
After=display-manager.service

[Service]
#ExecStart=/usr/bin/x11vnc -xkb --loop -noxrecord -noxfixes -noxdamage -display :0 -auth guess -rfbport 5901 -rfbauth /home/dalexander/.vnc/passwd -o /var/log/x11vnc.log
ExecStart=/opt/x11vnc/x11vnc_switch_user
ExecStop=/usr/bin/killall x11vnc_switch_user && /usr/bin/killall x11vnc
Restart=on-failure
RestartSec=2

[Install]
WantedBy=multi-user.target
EOF
mkdir -p /opt/x11vnc/
cat >/opt/x11vnc/x11vnc_switch_user<<EOF
#!/bin/bash

#/usr/bin/x11vnc -loop -nopw -xkb -repeat -noxrecord -noxfixes -noxdamage -forever -rfbport 5900 -display :0 -auth guess -o /var/log/x11vnc.log
#ExecStop=/usr/bin/killall x11vnc

while true
do
        echo "Checking Xorg used console..."

        CURRENT_CONSOLE=`fgconsole`
        CURRENT_XORG_PORT=`ps aux | grep Xorg | grep "vt$CURRENT_CONSOLE" | cut -d':' -f 4 | cut -c1-1`
        echo "Xorg port=$CURRENT_XORG_PORT"

        EXIST_VNC_SERVER_ON_SAME_PORT=`ps aux | grep x11vnc | grep "display :$CURRENT_XORG_PORT" | head -n 1 | cut -d':' -f 4 | cut -c1-1`

        if [ -n "$EXIST_VNC_SERVER_ON_SAME_PORT" ]
        then
                echo "VNC already run on port $CURRENT_XORG_PORT"
        else
                echo "VNC does NOT run on port $CURRENT_XORG_PORT, starting x11vnc on port 590$CURRENT_XORG_PORT..."
                /usr/bin/x11vnc -loop -nopw -xkb -repeat -noxrecord -noxfixes -noxdamage -forever -rfbport "590$CURRENT_XORG_PORT" -display :$CURRENT_XORG_PORT -auth guess -o /var/log/x11vnc.$CURRENT_XORG_PORT.log &
        fi

        echo "Waiting 1 second..."
        sleep 1
done
EOF
ufw allow 5900:5901/tcp

systemctl daemon-reload
systemctl start x11vnc.service
systemctl enable x11vnc.service



