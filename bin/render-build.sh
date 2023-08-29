#!/usr/bin/env bash
# exit on error
set -o errexit

# bundle update
rm Gemfile.lock
bundle config unset deployment
gem install bundler -v 1.17.3
bundler _1.17.3_ install
# bundle install
# bundle lock --add-platform x86_64-linux
# bundle exec rake assets:precompile
# bundle exec rake assets:clean
# bundle exec rake db:migrate
# bundle exec rake db:seed

