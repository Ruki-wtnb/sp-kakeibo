# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    scope :get_daily, -> { where(id: ..5).pluck(:name, :id) }
    scope :get_fix, -> { where(id: 6..).pluck(:name, :id) }

    has_many :daily_costs
    has_many :fixed_costs
    has_many :category_total
end
