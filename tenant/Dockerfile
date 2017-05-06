FROM tenant-base

ARG tenant
ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV SECRET_KEY_BASE somesecret
ENV DATABASE_URL="postgres://myuser:mypass@localhost/somedatabase"
ENV RAILS_RELATIVE_URL_ROOT="/tenant-{$tenant}"

COPY . ./
RUN bundle exec rake assets:precompile

