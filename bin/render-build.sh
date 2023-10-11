#!/usr/bin/env bash
# exit on error
set -o errexit
gem install nokogiri --platform=ruby
bundle exec rake  db:migrate
bundle exec rake db:seed
bundle exec puma -C config/puma.rb
exec "$@"