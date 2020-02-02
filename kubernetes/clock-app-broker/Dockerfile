FROM ubuntu:latest
LABEL maintainer="patriciochavez"

RUN apt-get update && apt-get install mosquitto -y
COPY mosquitto.conf /etc/mosquitto/mosquitto.conf

EXPOSE 1883/tcp
EXPOSE 9001/tcp

ENTRYPOINT ["/usr/bin/service", "mosquitto", "start"]
