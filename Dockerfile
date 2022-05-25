FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:59a7587e179e48d748a8cbf7350160fb54e0de3fa8ec67b9df25fa8fca6b1cce

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
