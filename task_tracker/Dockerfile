FROM ruby:3.0-buster as back

ENV LANG C.UTF-8

RUN apt-get update --fix-missing \
    && apt install -y wget curl make gcc \
    zlib1g-dev libssl-dev build-essential libpq-dev libaio1 locales curl nodejs

RUN gem install bundler
RUN gem install rails -v 6.1
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

ENV SRC_PATH /usr/src/async_architecture/

WORKDIR $SRC_PATH
COPY ./Gemfile* $SRC_PATH

RUN bundle install
RUN rails webpacker:install
COPY . $SRC_PATH
RUN rm -rf $SRC_PATH/tmp/pids

CMD ["rails", "s", "-b", "0.0.0.0"]