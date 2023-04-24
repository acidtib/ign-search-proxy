FROM ruby:3.2.2-alpine

RUN apk add --no-cache \
  build-base \
  libxml2-dev \
  libxslt-dev

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3004

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]