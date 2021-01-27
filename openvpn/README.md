## OpenVPN server

Prepare system:

```
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
ip route | grep default
iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o ens160 -j MASQUERADE
```

Clone files and build image from Dockerfile:

```
docker build --tag openvpn-server.
```

Run image:

```
docker run --cap-add=NET_ADMIN --device /dev/net/tun:/dev/net/tun --restart always --name openvpn-server --hostname openvpn-server --network host -dit openvpn-server
```

Create client cert:

```
docker exec -it openvpn-server bash
cd /opt/openvpn-ca/
source vars
./build-key client
```

Use template:

```
client
dev tun
proto tcp

remote <ServerIP> 1194
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
</ca>

<cert>
</cert>

<key>
</key>
```
