FROM ruby:2.7.1-alpine
ENV BUNDLER_VERSION=2.1.4
RUN apk add --update --no-cache \
      build-base \
      curl \
      openssl \      
      tzdata 


RUN gem install bundler -v 2.1.4
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle check || bundle install


COPY . ./
ENTRYPOINT ["./docker-entrypoint.sh"]

