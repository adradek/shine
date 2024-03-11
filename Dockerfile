FROM ruby:2.4
LABEL maintainer="alex.kochurov@gmail.com"

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  libssl-dev

# Stable classic Yarn version
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | \
  tee /etc/apt/sources.list.d/yarn.list

# Install packages
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  nano \
  nodejs \
  postgresql-client \
  yarn

WORKDIR /usr/src/app

COPY . /usr/src/app/
RUN useradd -ms /bin/bash alexey

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
