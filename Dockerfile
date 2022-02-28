FROM gcr.io/personalsdm-216019/nodejs-base:16-stretch@sha256:f1889d766fb6553d45d93e37d5b77a3fb305c94af14e8375a0fb4d06ca83a886

COPY package.json package-lock.json ./

RUN  npm ci --no-optional \
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