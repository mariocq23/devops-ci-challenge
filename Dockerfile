FROM node:latest
ENV  NODE_OPTIONS=--openssl-legacy-provider
ADD . .
WORKDIR /.

RUN npm add file-type@16

RUN npm install
RUN npm run lint
RUN npm run prettier
RUN npm run test
RUN npm run build

ENTRYPOINT ["npm", "start"]