FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:5b044e1f5ed80bd92a05d47dd11b0852ed1b4854b291366abeb69192297d62f4

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
