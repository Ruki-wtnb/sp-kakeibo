# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


* cron関係
- 起動
    - bundle exec whenever --update-crontab && sudo cron && tail -f log/crontab.log
- 停止
    - sudo service cron stop
