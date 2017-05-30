FROM alpine:latest
MAINTAINER Octoblu <docker@octoblu.com>

RUN apk add -q --no-cache bash curl git jq python3 

RUN mkdir -p /tmp/remarshal \
  && curl --silent -L https://github.com/dbohdan/remarshal/archive/e05b424abacfcf23655c20d891acb51450eba083.tar.gz \
  | tar xzv --strip 1 -C /tmp/remarshal \
  && cd /tmp/remarshal \
  && python3 setup.py install \
  && cd - \
  && rm -rf /tmp/remarshal

WORKDIR /usr/src/app
COPY beekeeper-updater-docker-compose .

CMD ["/bin/bash", "./beekeeper-updater-docker-compose"]
