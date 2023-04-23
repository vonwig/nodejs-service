FROM alpine:3.14@sha256:eb3e4e175ba6d212ba1d6e04fc0782916c08e1c9d7b45892e9796141b1d379ae

RUN apk add --no-cache \
  nodejs

ENV NODE_ENV=production

COPY package.json ./

RUN  apk add --no-cache \
 npm \
 && npm i --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
