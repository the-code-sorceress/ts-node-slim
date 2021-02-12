FROM node:15.3-alpine3.12

RUN npm install -g typescript

WORKDIR /app