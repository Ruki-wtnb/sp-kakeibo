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
require "test_helper"

class IncomeTest < ActiveSupport::TestCase

  def setup
    @income = Income.new(price: 200000, year_month: "2024-01")
  end

  test "should be valid?" do
    assert @income.valid?
  end

  test "price should be present" do
    @income.price = nil
    assert_not @income.valid?
  end

  test "year_month should be present" do
    @income.year_month = ""
    assert_not @income.valid?
  end

  test "year_month's format should be YYYY-MM" do
    @income.year_month = 202401
    assert_not @income.valid?
  end

end
