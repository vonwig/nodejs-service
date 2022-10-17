FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:c0a38f722b21c6c0bdb0b36c94302a128f074589d2cefd2d1d77975ba9a3d57c

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
