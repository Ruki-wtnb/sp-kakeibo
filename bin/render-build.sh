#!/usr/bin/env bash
# exit on error
set -o errexit
bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate

set -e
if [ -f ./db/development.sqlite3 ]; then
  rm ./db/development*
fi

# Restore the database
litestream restore -v -if-replica-exists -o ./db/development.sqlite3 gcs://spkakeibo-litestream
