FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:1702496ebfb82df4be7e8905b019548acd982a2b56bfb589dbf749bab01ed620

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

# atomist-start: fix for https://dso.atomist.com/cve/ATM-2022-0002
RUN apk add --no-cache \
  busybox=1.33.1-r6
# atomist-end
