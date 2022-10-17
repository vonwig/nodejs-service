FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:1b325cbe6b6f329eae737fc2090be03a4ce3cab09e57544ff08267e72033298e

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
