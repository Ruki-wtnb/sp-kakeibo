# == Schema Information
#
# Table name: fixed_costs
#
#  id          :integer          not null, primary key
#  price       :integer
#  year_month  :string
#  category_id :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class FixedCost < ApplicationRecord

    belongs_to :category

    validates :category_id,
    presence: true, 
    numericality: { only_integer: true },
    length: { is: 1}

    REGEX_FOR_YEAR_MONTH = /\A20[0-9]{2}-(0[1-9]|1[0-2])\z/
    validates :year_month, presence: true,
    format: {
        with: REGEX_FOR_YEAR_MONTH,
        message: "YYYY-MMの形式で入力してください。"
    },
    uniqueness: { scope: :category_id }
    scope :get_this_month, -> { where(year_month: Date.today.strftime("%Y-%m")).order(categoty_id: :asc) }
    scope :count_this_month, -> { where(year_month: Date.today.strftime("%Y-%m")).count }

end
