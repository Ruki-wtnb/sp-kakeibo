namespace :monthly_task do
    desc "毎月の収入を登録"
    task :income => :environment do
        Income.create(price: 200000, year_month: Date.today.strftime("%Y-%m")) 
    end

    desc "毎月の支出を登録"
end
