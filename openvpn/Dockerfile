# Based on Ubuntu 20.04 image
FROM ubuntu:18.04
MAINTAINER "Yakunin V. Vasily" <vasily.yakunin@gmail.com>
ENV TZ=Europe/Moscow
ARG DEBIAN_FRONTEND=noninteractive

# Install pre-software
RUN apt update && apt upgrade -y
RUN apt install -q -y openvpn easy-rsa
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mkdir -p /var/run
COPY openvpn.conf /etc/openvpn/

RUN make-cadir /opt/openvpn-ca

COPY openssl.cnf /opt/openvpn-ca
COPY vars /opt/openvpn-ca

RUN cd /opt/openvpn-ca && /bin/bash -c "source vars && ./clean-all && ./build-ca --batch && ./build-key-server --batch server && ./build-dh --batch"
RUN /bin/bash -c "cp /opt/openvpn-ca/keys/{server.crt,server.key,ca.crt,dh2048.pem} /etc/openvpn"
RUN cd /opt/openvpn-ca && /bin/bash -c "source vars && ./build-key --batch client"

EXPOSE 1194

CMD ["sh", "-c", "service openvpn start ; tail -F /etc/openvpn/openvpn-status.log"]
