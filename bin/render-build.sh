#!/usr/bin/env bash
# exit on error
set -o errexit
gem update --system
bundle config set force_ruby_platform true
bundle exec rake  db:migrate
bundle exec rake db:seed
bundle exec puma -C config/puma.rb
exec "$@"