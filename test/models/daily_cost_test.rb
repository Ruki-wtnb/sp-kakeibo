# == Schema Information
#
# Table name: daily_costs
#
#  id          :integer          not null, primary key
#  pay_day    :date
#  category_id :string
#  detail      :string
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class DailyCostTest < ActiveSupport::TestCase
  def setup
    @daily_cost = DailyCost.new(pay_day: "2023-11-16", category_id: "1", detail: "ななまがりやおき", price: 750)
  end

  test "should be valid?" do
    assert @daily_cost.valid?
  end

  test "pay_day should be present" do
    @daily_cost.pay_day = ""
    assert_not @daily_cost.valid?
  end

  test "category_id should be present" do
    @daily_cost.category_id = ""
    assert_not @daily_cost.valid?
  end

  test "detail should be present" do
    @daily_cost.detail = ""
    assert_not @daily_cost.valid?
  end

  test "price should be present" do
    @daily_cost.price = ""
    assert_not @daily_cost.valid?
  end

  test "pay_day's type should be date" do
    @daily_cost.pay_day = "today"
    assert_not @daily_cost.valid?
  end

  test "category_id's value can conversion integer" do
    @daily_cost.category_id = "t"
    assert_not @daily_cost.category_id =~ /^[0-9]+$/
  end

  test "price should not be minus" do
    @daily_cost.price = -1
    assert_not @daily_cost.valid?
  end

  test "price should not be over 100000" do
    @daily_cost.price = 100000
    assert_not @daily_cost.valid?
  end
end
