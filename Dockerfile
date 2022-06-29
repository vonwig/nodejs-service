FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:4fd11e94f2ae5869994d52fbd10ca0b2bf4b1e706053da1f1ec04c155e912cf6

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
