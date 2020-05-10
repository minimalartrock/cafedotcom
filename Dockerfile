FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client && apt-get install -y vim

RUN mkdir /cafedotcom
ENV APP_HOME /cafedotcom
WORKDIR $APP_HOME

COPY Gemfile $APP_HOME/Gemfile
COPY Gemfile.lock $APP_HOME/Gemfile.lock

RUN gem install bundler
RUN bundle install

COPY . $APP_HOME

RUN mkdir -p $APP_HOME/tmp/sockets

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
