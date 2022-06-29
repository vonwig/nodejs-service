FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:047944bb01d00ea1c401adf6bdf84d0e6d838405939034024422a79f2143787c

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
