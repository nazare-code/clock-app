FROM eclipse-mosquitto:latest
LABEL maintainer="patriciochavez"

RUN apk update && apk upgrade && apk add bash

COPY mosquitto.conf /mosquitto/config/mosquitto.conf

EXPOSE 1883/tcp
EXPOSE 9001/tcp

ENTRYPOINT ["/usr/sbin/mosquitto", "-d", "-c", "//mosquitto/config/mosquitto.conf"]
