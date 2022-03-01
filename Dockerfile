FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:5fe99d228a5490b1f18fa56da5e0b2d4590f0079da261e1e1f690ba96a53f5c9

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force \
 && apk del npm

COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080

# Set up labels to make image linking work
ARG COMMIT_SHA
ARG DOCKERFILE_PATH=Dockerfile

LABEL org.opencontainers.image.revision=$COMMIT_SHA \
  org.opencontainers.image.source=$DOCKERFILE_PATH