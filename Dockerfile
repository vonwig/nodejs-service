FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:e26781892a2a7baa7cb54222eeb2c3f907bf122eedfd58823d8e64260387c516

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
