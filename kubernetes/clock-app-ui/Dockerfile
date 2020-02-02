FROM node:latest
LABEL maintainer="patriciochavez"
RUN mkdir -p /usr/src/app/public/
WORKDIR /usr/src/app

COPY package.json /usr/src/app/
RUN npm install

COPY index.js /usr/src/app/

COPY public /usr/src/app/public/

EXPOSE 3000/tcp
CMD [ "npm", "start" ]
