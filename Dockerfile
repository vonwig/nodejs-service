FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:2478c2e46d3ad7c83b1ed1ff62c707267c01f410a547d2255cbae49036f60479

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
