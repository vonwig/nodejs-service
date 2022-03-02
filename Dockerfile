FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:e2e3c80ab04291f9842f2180e2899c6244a86598a45d9977c3e4a8bf153b80a1

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080

# Set up labels to make image linking work
ARG COMMIT_SHA
ARG DOCKERFILE_PATH=Dockerfile

LABEL org.opencontainers.image.revision=$COMMIT_SHA \
  org.opencontainers.image.source=$DOCKERFILE_PATH
