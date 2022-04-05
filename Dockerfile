FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:ef3cf1acf5a65554ab26cc17986529e3911f724624bed7e6a5a4a24d5e63af60

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
