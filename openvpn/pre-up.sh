#!/bin/bash

#!/bin/bash

RIP=`ip route | grep default`
SIP=`echo ${RIP##*dev} | awk '{print $1}'`

IPFWD=`grep -x 'net.ipv4.ip_forward=1' /etc/sysctl.conf | wc -l`
IPTBL=`sudo iptables -L -v -n -t nat | grep 192.168.0 | wc -l`

if [ $IPFWD -ne 1 ]; then
  sudo bash -c 'echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf'
fi

if [ $IPTBL -ne 1 ]; then
  sudo iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o $SIP -j MASQUERADE
fi
