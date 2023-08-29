#!/usr/bin/env bash
# exit on error
set -o errexit

# bundle update
bundle install
bundle config set --local deployment 'true'
bundle config set --local without 'test development'
bundle install
# bundle install
# bundle lock --add-platform x86_64-linux
# bundle exec rake assets:precompile
# bundle exec rake assets:clean
# bundle exec rake db:migrate
# bundle exec rake db:seed

