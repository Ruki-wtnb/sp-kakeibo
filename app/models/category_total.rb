# == Schema Information
#
# Table name: category_totals
#
#  id          :integer          not null, primary key
#  price       :integer
#  category_id :string
#  year_month  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class CategoryTotal < ApplicationRecord

    after_save :caluculate_monthly_total
    after_update :caluculate_monthly_total
    after_destroy :caluculate_monthly_total

    validates :category_id,
        presence: true, 
        numericality: { only_integer: true },
        length: { is: 1},
        uniqueness: { scope: :year_month}
    validates :price,
        presence: true,
        numericality: { only_integer: true, greater_than: 0, less_than: 100000 }
    
    VALID_REGEX = /\A^(20[0-9]{2})-(0[1-9]|1[0-2])$\z/i
    validates :year_month,
        presence: true,
        format: { with: VALID_REGEX }

    belongs_to :category

    scope :get_this_month, -> { where('year_month LIKE ?', "%#{Date.today.strftime("%Y-%m")}%") }

    private

    def caluculate_monthly_total

        income = Income.where(year_month: self.year_month).sum(:price)
        all_category_total = CategoryTotal.where(year_month: self.year_month).sum(:price)

        total = income - all_category_total

        monthly_total ||= MonthlyTotal.find_by(year_month: self.year_month)

        if monthly_total.nil?
            MonthlyTotal.create(year_month: self.year_month, price: total)
        else
            MonthlyTotal.update(year_month: self.year_month, price: total)
        end
    end

end
