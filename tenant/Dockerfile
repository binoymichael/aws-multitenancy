FROM ruby:2.3-slim
ARG tenant

RUN apt-get update && apt-get install -qq -y --fix-missing --no-install-recommends build-essential nodejs libpq-dev postgresql-client-9.4

ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5 --without development test

ENV RAILS_ENV production
ENV SECRET_KEY_BASE somesecret
ENV DATABASE_URL="postgres://myuser:mypass@localhost/somedatabase"
ENV RAILS_RELATIVE_URL_ROOT="/tenant-{$tenant}"

COPY . ./
RUN bundle exec rake assets:precompile
