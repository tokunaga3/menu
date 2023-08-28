#!/usr/bin/env bash
# exit on error
set -o errexit
gem install bundler -v 1.17.3

bundle lock --add-platform x86_64-linux

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate
bundle exec rake db:seed
