# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# Cronの起動
# bundle exec whenever --update-crontab && sudo cron && tail -f log/crontab.log
# Cronの停止
# sudo service cron stop

require File.expand_path(File.dirname(__FILE__) + '/environment')

# コンテナ起動時の環境変数をcron独自の環境変数にパス
ENV.each { |k, v| env(k, v) }

#出力先のログ
set :output, 'log/cron_monthly_batch.log'
#実行環境
set :environment, :development
    
#実行日時
every 1.month, at: 'start of the month at 7am' do
    rake 'monthly_task:income'
    rake 'monthly_task:fixed_costs'
end
