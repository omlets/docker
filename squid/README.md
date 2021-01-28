## Squid HTTP Proxy server

Clone files and build image from Dockerfile:

```
docker build --tag squid-server .
```

Run image:

```
docker run -dit --restart always --name squid-server --hostname squid-server --publish 3128:3128 squid-server:latest
```

Or build and run use docker-compose:

```
docker-compose build
docker-compose up -d
```

To create username and password pair, in container run command:

```
htpasswd -c /etc/squid/squid_passwd username
```

After add user in squid proxy server, restart container:

```
docker restart squid-server
```

