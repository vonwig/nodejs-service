FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:6f16497e8a11ef6edf74ad60bd53347b8dbb5c129bdd352a43e5866aeb2e4fbc

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
