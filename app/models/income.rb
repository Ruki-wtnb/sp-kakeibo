# == Schema Information
#
# Table name: incomes
#
#  id         :integer          not null, primary key
#  price      :integer
#  year_month :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Income < ApplicationRecord
    after_save :caluculate_monthly_total
    after_update :caluculate_monthly_total
    after_destroy :caluculate_monthly_total

    validates :price, presence: true,
    numericality: { 
        only_integer: true,
        greater_than: 0,
        less_than: 500000
    }

    REGEX_FOR_YEAR_MONTH = /\A20[0-9]{2}-(0[1-9]|1[0-2])\z/
    validates :year_month, presence: true,
    format: {
        with: REGEX_FOR_YEAR_MONTH,
        message: "YYYY-MMの形式で入力してください。"
    },
    uniqueness: true
    scope :get_this_month, -> { find_by(year_month: Date.today.strftime("%Y-%m")) }
    scope :count_this_month, -> { where(year_month: Date.today.strftime("%Y-%m")).count }
end
