#
# Elasticsearch Dockerfile
#
# https://github.com/dockerfile/elasticsearch
#
# Forked to use with alpine linux
#

# Pull base image.
FROM gliderlabs/alpine:3.1
MAINTAINER Wojtek Majewski <jumski@gmail.com>

ENV ES_PKG_NAME elasticsearch-0.20.6

RUN apk-install bash openjdk7-jre-base

# Install Elasticsearch.
RUN \
  cd / && \
  wget http://download.elastic.co/elasticsearch/elasticsearch/$ES_PKG_NAME.tar.gz && \
  tar xvzf $ES_PKG_NAME.tar.gz && \
  rm -f $ES_PKG_NAME.tar.gz && \
  mv /$ES_PKG_NAME /elasticsearch

# Define mountable directories.
VOLUME ["/data"]

# Mount elasticsearch.yml config
ADD config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["/elasticsearch/bin/elasticsearch", "-f"]

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300
