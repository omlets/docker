#!/bin/bash

CCA=`docker exec -i openvpn-server bash -c 'cat /opt/openvpn-ca/keys/ca.crt'`
CCERT=`docker exec -i openvpn-server bash -c 'cat /opt/openvpn-ca/keys/client.crt'`
CKEY=`docker exec -i openvpn-server bash -c 'cat /opt/openvpn-ca/keys/client.key'`
SIP=`ip route | grep default | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"`

cat > client.ovpn <<EOF

client
dev tun
proto tcp

remote $SIP 1194
cipher AES-256-CBC
resolv-retry infinite

nobind
persist-key
persist-tun

verb 2
mute 20
keepalive 10 120

float
resolv-retry infinite

<ca>
$CCA
</ca>

<cert>
$CCERT
</cert>

<key>
$CKEY
</key>
EOF
