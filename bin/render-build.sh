#!/usr/bin/env bash
# exit on error
set -o errexit

bundle config set force_ruby_platform true
bundle install
bundle exec rake  db:migrate
# bundle exec rake db:seed
mkdir -p tmp/pids
bundle exec puma -C config/puma.rb
exec "$@"