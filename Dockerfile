FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:31f4d51b01890f5c0674d7ef20f7ed4d14cbbeca6a12752cddf7e233164a9607

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
