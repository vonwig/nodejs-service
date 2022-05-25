FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:2e453d41dcba0b03e955ba84334684d9384cb9a473188304a5cb95a6fe2be0e0

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
