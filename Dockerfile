FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:e592ec727744cc2b78be5f36232f078dce996f625e36e9c5f65a85f6733f0bd0

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
