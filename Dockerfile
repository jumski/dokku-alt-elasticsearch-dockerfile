FROM gliderlabs/alpine:3.1
MAINTAINER Wojtek Majewski <jumski@gmail.com>

ENV ES_PKG_NAME elasticsearch-0.20.6

RUN apk-install bash openjdk7-jre-base

RUN \
  cd / && \
  wget http://download.elastic.co/elasticsearch/elasticsearch/$ES_PKG_NAME.tar.gz && \
  tar xvzf $ES_PKG_NAME.tar.gz && \
  rm -f $ES_PKG_NAME.tar.gz && \
  mv /$ES_PKG_NAME /elasticsearch

VOLUME ["/data"]

ADD config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml

WORKDIR /data

CMD ["/elasticsearch/bin/elasticsearch", "-f"]

EXPOSE 9200
EXPOSE 9300
