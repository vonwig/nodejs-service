FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:2252e930bbfe70ff552572a914d4dad106295883c747904bc78ccb2635d3b0b9

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
