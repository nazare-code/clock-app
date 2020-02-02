FROM ubuntu:latest
LABEL maintainer="patriciochavez"

RUN apt-get update && apt-get install mosquitto -y
COPY mosquitto.conf /etc/mosquitto/mosquitto.conf

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY broker_start.sh .

EXPOSE 1883/tcp
EXPOSE 9001/tcp

ENTRYPOINT ["/bin/bash", "/usr/src/app/broker_start.sh"]

