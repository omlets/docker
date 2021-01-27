## OpenVPN server

Before up container run ./pre-up.sh
```
docker-compose up -d
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
