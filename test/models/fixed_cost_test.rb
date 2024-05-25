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
require "test_helper"

class FixedCostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
