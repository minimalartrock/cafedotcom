FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir /cafedotcom
ENV APP_HOME /cafedotcom
WORKDIR $APP_HOME

COPY ./Gemfile $APP_HOME/Gemfile
COPY ./Gemfile.lock $APP_HOME/Gemfile.lock

RUN gem install bundler
RUN bundle install
COPY . $APP_HOME
