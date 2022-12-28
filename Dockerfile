FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:5b63e3072cfece471597f13bab4ce9d75cd2ec076d4ae4d99b3dbc83249bb0bd

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
