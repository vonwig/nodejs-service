FROM gcr.io/personalsdm-216019/nodejs-base:16-stretch

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