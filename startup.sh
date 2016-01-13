#!/bin/sh
set -e
set -x

cd /root/juniper-vpn-py
./juniper-vpn.py --host {{JUNIPER_HOST}} --username {{JUNIPER_USER}} --password {{JUNIPER_PASSWORD}} --stdin DSID=%DSID% openconnect --no-cert-check --juniper %HOST% --cookie-on-stdin &
iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE
iptables -A FORWARD -i eth0 -j ACCEPT