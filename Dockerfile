FROM ruby:2.6.0-alpine

RUN apk add --no-cache alpine-sdk sqlite-dev nodejs tzdata && gem install bundler

RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD bundle exec rails s -b 0.0.0.0

EXPOSE 3000
