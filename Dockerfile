FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:baf8a6da8fea30fe0649f3307ca785235454a5b7a0292e9194a32669faa3b302

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
