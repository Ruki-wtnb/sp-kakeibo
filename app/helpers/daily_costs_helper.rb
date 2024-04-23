module DailyCostsHelper
    def get_daily_categories
        Category.get_daily
    end
end
