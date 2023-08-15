FROM alpine:3.14@sha256:bd9137c3bb45dbc40cde0f0e19a8b9064c2bc485466221f5e95eb72b0d0cf82e

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
