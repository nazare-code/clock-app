FROM alpine:latest
LABEL maintainer="patriciochavez"

RUN apk add --update nodejs nodejs-npm

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json /usr/src/app/
RUN npm install

COPY . /usr/src/app

EXPOSE 3000/tcp

CMD [ "npm", "start" ]
