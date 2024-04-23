# タスクの実行
# bundle exec rake monthly_task:

namespace :monthly_task do
  desc "毎月の収入を登録"
  task :income => :environment do
    if !Income.find_by(year_month: Date.today.strftime("%Y-%m"))
      Income.create(price: 200000, year_month: Date.today.strftime("%Y-%m"))
    end
  end
  
  desc "毎月の支出を登録"
  task :fixed_cost => :environment do
    if !FixedCost.find_by(year_month: Date.today.strftime("%Y-%m"), category_id: 6)
      FixedCost.create(price: 12800, year_month: Date.today.strftime("%Y-%m"), category_id: 6)
    end

    if !FixedCost.find_by(year_month: Date.today.strftime("%Y-%m"), category_id: 9)
      FixedCost.create(price: 4733, year_month: Date.today.strftime("%Y-%m"), category_id: 9)
    end
  end
end
