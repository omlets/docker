FROM ubuntu:18.04
MAINTAINER "Yakunin V. Vasily" <vasily.yakunin@gmail.com>
ENV TZ=Europe/Moscow
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y
RUN apt install -q -y squid apache2-utils
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mkdir -p /var/run
COPY squid.conf /etc/squid
RUN squid -z -F

EXPOSE 3128
CMD ["sh", "-c", "service squid start ; tail -F /var/log/squid/access.log"]
