FROM node:9.9.0-alpine

ARG RUBY_RELEASE="https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.gz"
ARG RUBY="ruby-2.4.0"

RUN apk add --no-cache git make gcc g++ libc-dev pkgconfig \
    libxml2-dev libxslt-dev postgresql-dev coreutils curl wget bash \
    gnupg tar linux-headers bison readline-dev readline zlib-dev \
    zlib yaml-dev autoconf ncurses-dev curl-dev apache2-dev \
    libx11-dev libffi-dev tcl-dev tk-dev

SHELL ["/bin/bash", "-l", "-c"]

RUN wget --no-verbose -O ruby.tar.gz ${RUBY_RELEASE} && \
    tar -xf ruby.tar.gz && \
    cd /${RUBY} && \
    ./configure && \
    make && \
    make test && \
    make install

RUN cd / && \
    rm ruby.tar.gz && \
    rm -rf ${RUBY_NAME}
