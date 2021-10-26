ARG RUBY_VERSION

FROM ruby:$RUBY_VERSION-alpine

ENV LANG=C.UTF-8 \
    GEM_HOME=/bundle \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3 \
    BUNDLE_PATH=/bundle \
    BUNDLE_APP_CONFIG=/bundle \
    BUNDLE_BIN=/bundle/bin \
    PATH=/app/bin:/bundle/bin:$PATH

RUN apk update &&\
    apk upgrade &&\
    apk add --no-cache \
        alpine-sdk \
        build-base \
        tzdata \
        libidn-dev \
        postgresql-dev \
        postgresql \
    && gem update --system

RUN gem install bundler

WORKDIR /app
