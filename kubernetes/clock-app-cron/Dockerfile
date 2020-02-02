FROM node:latest
LABEL maintainer="patriciochavez"
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json /usr/src/app/
RUN npm install

COPY index.js /usr/src/app/

CMD [ "npm", "start" ]
