FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:f83f87222fb610f35292febde6ef0b1b13de4e480d3f817a9b8fffc2f7c3abfa

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
