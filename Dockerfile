# Build mosquitto from source
# file is using http://mosquitto.org/files/source/mosquitto-1.3.5.tar.gz
FROM ubuntu:latest
MAINTAINER Iori Mizutani <iori.mizutani@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN \ 
	apt-get update ;\
	apt-get upgrade -y ;\
	apt-get install -y wget build-essential libwrap0-dev libssl-dev python-distutils-extra libc-ares-dev

RUN \
	mkdir -p /usr/local/src ;\
	cd /usr/local/src ;\
	wget http://mosquitto.org/files/source/mosquitto-1.3.5.tar.gz ;\
	tar xvzf ./mosquitto-1.3.5.tar.gz ;\
	cd /usr/local/src/mosquitto-1.2.3 ;\
	make ;\
	make install

RUN adduser --system --disabled-password --disabled-login mosquitto
EXPOSE 1883
CMD ["/usr/local/sbin/mosquitto"]
