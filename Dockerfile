FROM node:15.3-alpine3.12

ENV SHELL=/bin/bash

RUN npm install -g typescript

WORKDIR /app