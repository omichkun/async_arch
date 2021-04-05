FROM ruby:2.7.0-buster as auth

ENV LANG C.UTF-8

RUN apt-get update --fix-missing \
    && apt install -y wget curl make gcc \
    zlib1g-dev libssl-dev build-essential libpq-dev libaio1 locales curl nodejs

RUN gem install bundler -v 2.1.4
RUN gem install rails -v 6.1
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

ENV SRC_PATH /usr/src/async_architecture/

WORKDIR $SRC_PATH
COPY ./Gemfile* $SRC_PATH

RUN bundle install
RUN rails webpacker:install
RUN rails db:migrate
COPY . $SRC_PATH

CMD ["rails", "s", "-b", "0.0.0.0"]