FROM alpine:3.18

RUN apk add --no-cache \
  nodejs

ENV NODE_ENV=production

COPY package.json ./

RUN  apk add --no-cache \
 npm \
 && npm i --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

#ENV GITHUB_TOKEN=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

EXPOSE 8080
