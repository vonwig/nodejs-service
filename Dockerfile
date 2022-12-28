FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:351b47290d2fbd30cedec7bd28154cf9d76a1b15020821e20233484e6b3dbe1d

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
