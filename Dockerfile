FROM ruby:3.1.4
ENV LANG C.UTF-8
EXPOSE 8080

RUN apt-get update -qq \
  && apt-get install -y sqlite3 nodejs npm \
  && rm -rf /var/lib/apt/lists/* \
  && npm install --global yarn
RUN gem install bundler -v 2.3.14

# Download the static build of Litestream directly into the path & make it executable.
# This is done in the builder and copied as the chmod doubles the size.
ADD https://github.com/benbjohnson/litestream/releases/download/v0.3.8/litestream-v0.3.8-linux-amd64-static.tar.gz /tmp/litestream.tar.gz
RUN tar -C /usr/local/bin -xzf /tmp/litestream.tar.gz

# install linux packages
ENV DEBIAN_FRONTEND=nininteractive
RUN apt update \
    && apt install -y cron \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=dialog

COPY . /sp-kakeibo
WORKDIR /sp-kakeibo
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

# コンテナー起動時に毎回実行されるスクリプトを追加
COPY ./litestream.yml /etc/litestream.yml
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

#railsを起動する
CMD ["rails", "server", "-b", "0.0.0.0"]

