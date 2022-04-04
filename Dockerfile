FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:ec767fc5fee0616b5062baeaaffa8fd2221855ce2ad7b91bcf12150b282ffaa5

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
