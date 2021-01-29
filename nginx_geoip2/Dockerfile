# Based on Ubuntu 20.04 image

FROM ubuntu:20.04
MAINTAINER "Yakunin V. Vasily" <vasily.yakunin@gmail.com>
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y
RUN apt install -y software-properties-common

RUN add-apt-repository ppa:maxmind/ppa -y
RUN apt install libmaxminddb0 libmaxminddb-dev mmdb-bin geoipupdate -y

COPY nginx_1.19.6-1_amd64.deb /opt
RUN mkdir /var/log/nginx
RUN mkdir /var/lib/nginx

#RUN adduser --system --no-create-home --shell /bin/nologin  www-data
#RUN groupadd www-data

RUN dpkg -i /opt/nginx_1.19.6-1_amd64.deb

RUN rm /etc/nginx/*.default
RUN mkdir /etc/nginx/conf.d

COPY nginx.conf /etc/nginx
COPY server.conf /etc/nginx/conf.d

COPY GeoIP.conf /etc/
RUN geoipupdate

#EXPOSE 80, 443
CMD ["sh", "-c", "/usr/sbin/nginx; tail -F /var/log/nginx/error.log"]
