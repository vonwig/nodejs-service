FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:684a6bd8cc4e09da1fc6a89d68e9ed0f7f67b072a34dc5474b209c56e20a9cb7

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
