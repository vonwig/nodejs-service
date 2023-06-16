FROM alpine:3.18

RUN apk add --no-cache \
  nodejs

ENV NODE_ENV=production

COPY package.json ./

RUN  apk add --no-cache \
 npm \
 && npm i --no-optional \
 && npm cache clean --force \
 && apk del npm
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
