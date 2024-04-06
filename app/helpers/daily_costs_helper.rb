module DailyCostsHelper

    def get_categories
        Category.get_daily
    end

end
