FROM ruby:2.6.3-alpine3.10 AS builder

RUN apk add --no-cache alpine-sdk \
    nodejs \
    tzdata \
    mysql-client \
    mysql-dev

WORKDIR /tmp
COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

RUN bundle install


FROM ruby:2.6.3-alpine3.10

RUN apk --no-cache add alpine-sdk \
    nodejs \
    tzdata \
    mysql-client \
    mysql-dev

COPY --from=builder /usr/local/bundle /usr/local/bundle

ENV APP_ROOT /usr/src/app
WORKDIR $APP_ROOT