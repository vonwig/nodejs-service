FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:888f02f2a663711c8bf2e328bafd483334f9c8b19784ca52f38ecf607d5bf81e

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
