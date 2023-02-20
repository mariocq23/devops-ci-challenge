FROM alpine:latest
ENV  NODE_OPTIONS=--openssl-legacy-provider
ADD . .
WORKDIR /.

#COPY --chown=node:node package-lock.json .
RUN apk update
RUN apk upgrade
RUN apk add --update nodejs npm

RUN npm add file-type@16
RUN reboot

RUN npm install
RUN npm run lint
RUN npm run prettier
RUN npm run test
RUN npm run build