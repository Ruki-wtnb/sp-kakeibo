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
require "test_helper"

class MonthlyTotalTest < ActiveSupport::TestCase

  def setup
    @monthly_total = MonthlyTotal.new(price: 50000, year_month: "2022-02")
  end

  test "should be valid?" do
    assert @monthly_total.valid?
  end

  test "price should be present" do
    @monthly_total.price = nil
    assert_not @monthly_total.valid?
  end

  test "year_month should be present" do
    @monthly_total.year_month = ""
    assert_not @monthly_total.valid?
  end

  test "year_month's format should be YYYY-MM" do
    @monthly_total.year_month = 202401
    assert_not @monthly_total.valid?
  end

end
