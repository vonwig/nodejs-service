FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:0b89980385642a28977bfe4ff8d0afd8749cef42761388f75baa3ff0f99b666a

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
