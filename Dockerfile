FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:32b250f8564e7a59cfa6360b7dc7366ac279e9b840991d0eb1be1b4b1a603164

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
