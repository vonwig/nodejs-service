FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:d3c3bb6eacf1bf6177c983ebeecddf278e4762015aec61dd8fa88684097fa486

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
