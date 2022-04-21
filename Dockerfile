FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:1f2564c4e3bc1eef92551a053e4091c1c4482edf5f0afe36fd0613b908136b84

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
