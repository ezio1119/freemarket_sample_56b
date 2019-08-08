FROM ruby:2.6.3-alpine3.10 AS builder

RUN apk add --no-cache alpine-sdk \
    yarn \
    nodejs \
    tzdata \
    mysql-client \
    mysql-dev

WORKDIR /tmp
COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

RUN bundle install


FROM ruby:2.6.3-alpine3.10

RUN apk add --no-cache alpine-sdk \
    yarn \
    nodejs \
    tzdata \
    mysql-client \
    mysql-dev

COPY --from=builder /usr/local/bundle /usr/local/bundle

WORKDIR /app
ADD . /app
RUN mkdir -p /app/tmp/sockets
RUN RAILS_ENV=production bundle exec rake assets:precompile

ENV RAILS_ENV production

VOLUME /app/public
VOLUME /app/tmp

CMD /bin/sh -c "bundle exec rails db:create RAILS_ENV=production && bundle exec rails db:migrate RAILS_ENV=production && bundle exec rails s puma -e production"