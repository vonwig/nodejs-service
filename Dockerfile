FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:bcc11820d5108e863ebef736e13124147f45d2ecfd151e32949fa4bbd2ec1255

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
