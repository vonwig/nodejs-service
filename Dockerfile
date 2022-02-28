FROM atomist/nodejs-base:16-stretch@sha256:2c9e37809f190060a1efed2876ff4ee32b5f08ab26ee810117daf89287145f37

COPY package.json package-lock.json ./

RUN  npm ci --no-optional \
 && npm cache clean --force

COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
