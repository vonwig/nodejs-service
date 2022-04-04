FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:8f670d2fd4af112fb62623bba7f65f2d011f32533f9973ce68b548c11aec6d83

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
