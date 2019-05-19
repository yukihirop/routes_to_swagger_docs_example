FROM ruby:2.3.3

ENV APP_ROOT ./usr/src/app

RUN gem install bundler
COPY .  $APP_ROOT
WORKDIR $APP_ROOT
EXPOSE 9393
RUN bundle install --path vendor/bundle