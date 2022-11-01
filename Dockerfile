FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:e5af4eb04bc91c1785fed75dfa346aacf3304be9aface9c727c0c2466839e1c4

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
