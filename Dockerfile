FROM gcr.io/personalsdm-216019/nodejs-base:14-3.14@sha256:251c0040c3f614358b6e67fd9d92d13d18f0bb3c6f687aaa01b67cb5542a1971

COPY package.json package-lock.json ./

RUN  apk add --no-cache \
 npm=7.17.0-r0 \
 && npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080

# atomist-start: fix for https://dso.atomist.com/AQ1K5FIKA/overview/cve/ATM-2202-0001
RUN apk add --no-cache \
  busybox=1.33.1-r7
# atomist-end
