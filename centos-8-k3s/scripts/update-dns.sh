#!/bin/bash
sed -i -e 's/#DNS=/DNS=8.8.8.8/' /etc/systemd/resolved.conf
systemctl restart systemd-resolved