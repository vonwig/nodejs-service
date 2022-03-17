FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:aa20faf3f10c44474ee5b169737d0c82d036e4be394abc49ec41f8da690274e8

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
