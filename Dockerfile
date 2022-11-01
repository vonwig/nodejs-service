FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:2bb4cb473fca6a992580dc686a5289a41cde0830bca95299303dafa58594d3e8

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
