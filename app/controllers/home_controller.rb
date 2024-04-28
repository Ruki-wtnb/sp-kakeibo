class HomeController < ApplicationController
  def index
    # modelに定義しているメソッド
    @daily_costs ||= DailyCost.get_this_month
    @fixed_costs ||= FixedCost.get_this_month
    @category_total ||= CategoryTotal.get_this_month
    @income = Income.count_this_month != 0 ? Income.get_this_month : nil
    @monthly_total = MonthlyTotal.count_this_month != 0 ? MonthlyTotal.get_this_month : nil
  end
end
