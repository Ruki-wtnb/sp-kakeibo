class HomeController < ApplicationController
  # TODO 共通化できるように整理する。
  def index
    # modelに定義しているメソッド
    year_month = Date.today.strftime("%Y-%m")
    @daily_costs ||= DailyCost.get_this_month(Date.today.strftime(year_month))
    @fixed_costs ||= FixedCost.get_this_month(year_month)
    @category_total ||= CategoryTotal.get_this_month(year_month)
    @income = Income.count_this_month(year_month) != 0 ? Income.get_this_month(year_month) : nil
    @monthly_total = MonthlyTotal.count_this_month(year_month) != 0 ? MonthlyTotal.get_this_month(year_month) : nil
  end

  def show
    @year_month = params[:id]
    @daily_costs ||= DailyCost.get_this_month(Date.today.strftime(@year_month))
    @fixed_costs ||= FixedCost.get_this_month(@year_month)
    @category_total ||= CategoryTotal.get_this_month(@year_month)
    @income = Income.count_this_month(@year_month) != 0 ? Income.get_this_month(@year_month) : nil
    @monthly_total = MonthlyTotal.count_this_month(@year_month) != 0 ? MonthlyTotal.get_this_month(@year_month) : nil
    
    @this_year_month = Income.where('year_month LIKE ?', "%#{Date.today.year}%").pluck(:year_month)

  end
end
