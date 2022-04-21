FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:89c1801e3c30b139f0368677a771077d491f19e29db0db04fbcbc3f0cd577692

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
