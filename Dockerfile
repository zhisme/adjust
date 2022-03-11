FROM ruby:2.7.1

ARG SECRET_KEY_BASE

ARG RAILS_ENV
ENV RAILS_ENV production

ENV BUNDLER_VERSION 2.2.28
ENV BUNDLE_PATH /bundle

RUN mkdir -p /app && mkdir -p /bundle

WORKDIR /app

RUN apt-get update -qq && apt-get install -y build-essential nodejs redis-server

COPY Gemfile* ./

RUN gem update --system && gem install bundler && \
	bundle install

COPY . .

RUN bundle exec rails assets:precompile

EXPOSE 80


CMD bundle exec puma -C "-" -p 80 -w 3 --preload
