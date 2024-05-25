# == Schema Information
#
# Table name: monthly_totals
#
#  id         :integer          not null, primary key
#  price      :integer
#  year_month :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MonthlyTotal < ApplicationRecord
    validates :price, presence: true,
    numericality: { 
        only_integer: true,
        greater_than: -200000,
        less_than: 500000
    }

    REGEX_FOR_YEAR_MONTH = /\A20[0-9]{2}-(0[1-9]|1[0-2])\z/
    validates :year_month, presence: true,
    format: {
        with: REGEX_FOR_YEAR_MONTH,
        message: "YYYY-MMの形式で入力してください。"
    },
    uniqueness: true

    scope :get_this_month, -> (year_month) { find_by(year_month: year_month) }
    scope :count_this_month, -> (year_month) { where(year_month: year_month).count }

end
