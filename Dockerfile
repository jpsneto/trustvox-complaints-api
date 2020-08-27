FROM ruby:2.7.1-alpine
ENV BUNDLER_VERSION=2.1.4
RUN apk add --update --no-cache \
      build-base \
      curl \
      git \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      openssl \      
      tzdata 


RUN gem install bundler -v 2.1.4
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle check || bundle install


COPY . ./
ENTRYPOINT ["./docker-entrypoint.sh"]

