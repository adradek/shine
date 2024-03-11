FROM ruby:2.4
LABEL maintainer="alex.kochurov@gmail.com"

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  libssl-dev \
  nodejs

WORKDIR /usr/src/app

COPY . /usr/src/app/
RUN useradd -ms /bin/bash alexey

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
