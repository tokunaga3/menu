# ベースとなるDockerイメージの指定
FROM rubylang/ruby:3.0.6-focal

# 必要なパッケージのインストール

# env DEBIAN_FRONTEND=noninteractive apt-get update && \
#   env DEBIAN_FRONTEND=noninteractive
RUN apt-get update;
RUN apt-get install -y postgresql-client
RUN apt-get install -y  libpq-dev
RUN apt-get install -y  file
RUN apt-get install -y  nodejs
RUN apt-get install -y  curl

# ワークディレクトリの設定
RUN mkdir /app
WORKDIR /app

# システム依存性のインストール
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

# アプリケーションのコピー
COPY . /app

# COPY entrypoint.sh /usr/bin/

RUN chmod +x bin/render-build.sh

#RUN chmod +x /usr/bin/entrypoint.sh
#ENTRYPOINT ["entrypoint.sh"]

# RUN bundle exec rake assets:precompile
# RUN bundle exec rake assets:clean
