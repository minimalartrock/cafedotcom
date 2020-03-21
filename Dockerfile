FROM ruby:2.6.5
RUN apt-get update -qq && \
	apt-get install -y build-essential libpq-dev nodejs

# Rails App
RUN mkdir /cafedotcom
ENV APP_HOME /cafedotcom
WORKDIR $APP_HOME
ADD Gemfile $APP_HOME/Gemfile
ADD Gemfile.lock $APP_HOME/Gemfile.lock
RUN gem install bundler
RUN bundle install
ADD . $APP_HOME
RUN mkdir -p tmp/sockets

# Expose volumes to frontend
VOLUME $APP_HOME/public
VOLUME $APP_HOME/tmp

# Start Server
# TODO: environment
CMD bundle exec puma
