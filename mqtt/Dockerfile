FROM ubuntu:16.04

ARG  MOSQUITTOVERSION
ENV  MOSQUITTOVERSION 1.4.14

MAINTAINER ROCKY CHEN <rocky.cn@foxmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update     && \
    apt-get upgrade -y && \
    apt-get install -y wget build-essential libwrap0-dev libssl-dev python-distutils-extra \
                       libc-ares-dev uuid-dev libssl-dev cmake

WORKDIR /tmp
#RUN     wget https://github.com/warmcat/libwebsockets/archive/v1.3-chrome37-firefox30.tar.gz
RUN     wget https://github.com/warmcat/libwebsockets/archive/v2.4.0.tar.gz
RUN     tar xvzf v2.4.0.tar.gz
WORKDIR /tmp/libwebsockets-2.4.0
RUN     mkdir build
WORKDIR /tmp/libwebsockets-2.4.0/build
RUN     cmake .. -DOPENSSL_ROOT_DIR=/usr/bin/openssl
RUN     make && make install
RUN     ln -s /usr/local/lib/libwebsockets.so /usr/lib/libwebsockets.so
RUN     ln -s /usr/local/lib/libwebsockets.so.12 /usr/lib/libwebsockets.so.12

RUN     mkdir -p /usr/local/src
WORKDIR          /usr/local/src
RUN     wget http://mosquitto.org/files/source/mosquitto-$MOSQUITTOVERSION.tar.gz
RUN     tar xvzf ./mosquitto-$MOSQUITTOVERSION.tar.gz
COPY    config.mk /usr/local/src/mosquitto-$MOSQUITTOVERSION/config.mk
WORKDIR /usr/local/src/mosquitto-$MOSQUITTOVERSION
#RUN     sed 's/WITH_WEBSOCKETS\:\=no/WITH_WEBSOCKETS\:\=yes/' config.mk  
RUN     make && make install

RUN     adduser --system --disabled-password --disabled-login mosquitto
USER    mosquitto

COPY mosquitto.conf /etc/mosquitto/mosquitto.conf

EXPOSE 1883
EXPOSE 1886

CMD ["/usr/local/sbin/mosquitto"]