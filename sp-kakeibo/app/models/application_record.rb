class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  private
  def caluculate_monthly_total

      income = Income.where(year_month: self.year_month).sum(:price)
      all_category_total = CategoryTotal.where(year_month: self.year_month).sum(:price)
      all_fixed_total = FixedCost.where(year_month: self.year_month).sum(:price)

      total = income - (all_category_total + all_fixed_total)

      monthly_total ||= MonthlyTotal.find_by(year_month: self.year_month)

      if monthly_total.nil?
          MonthlyTotal.create(year_month: self.year_month, price: total)
      else
          MonthlyTotal.update(year_month: self.year_month, price: total)
      end
  end





end
