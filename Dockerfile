FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:e02b1960a33b810df5fc55839e1df79bac49d28894d0b43783f96bb9c36ebabd

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
