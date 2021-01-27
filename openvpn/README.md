## OpenVPN server

Change the organization name and other parameters in the vars file.

Be careful to change only the parameters below and nothing else.

```
export KEY_COUNTRY="RU"
export KEY_PROVINCE="Russia"
export KEY_CITY="Moscow"
export KEY_ORG="IT Dept."
export KEY_EMAIL="vasily.yakunin@gmail.com"
export KEY_OU="IT Dept."
```

Before up container run ./pre-up.sh to prepare new system

```
./pre-up.sh
docker-compose build
docker-compose up -d

```
or
```
./pre-up.sh
docker-compose up -d --build
```

Create client configuration:

```
./client.sh
```
