## OpenVPN server

Before up container run ./pre-up.sh
```
docker-compose build
docker-compose up -d

```
or
```
docker-compose up -d --build
```

Create client configuration:

```
./client.sh
```
