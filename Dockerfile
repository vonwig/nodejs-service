FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:ee11951f1fcf2fcc8f86ebd3672cfbd63ef41917ae867e3c401e0d154fe91cb5

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
