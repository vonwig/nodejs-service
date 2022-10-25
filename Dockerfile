FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:d62244cacf8779f47997efb5b52c8783470b68b988848e87c530c1b065a5eaac

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
