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
require "test_helper"

class CategoryTotalTest < ActiveSupport::TestCase

  def setup
    @category_total = category_totals(:total_one)
  end

  test "should be valid?" do
    assert @category_total.valid?
  end

  test "price should be present" do
    @category_total.price = ""
    assert_not @category_total.valid?
  end

  test "category_id should be present" do
    @category_total.category_id = ""
    assert_not @category_total.valid?
  end

  test "year_month syould be YYYY-MM" do
    @category_total.year_month = "202301"
    assert_not @category_total.valid?
  end

  test "year_month and category_id's combination should not duplicate" do
    @category_total2 = CategoryTotal.new(price: 30000, category_id: "1", year_month: "2024-01")
    @category_total2.valid?
  end

  test "caluculate total when dailycost input" do
    @cost = DailyCost.create(pay_date: Date.today, category_id: "1", detail: "ななまがりやおき", price: 750)
    @category_total = CategoryTotal.find_by(category_id: "1", year_month: Date.today.strftime("%Y-%m"))
    assert @category_total.price == 750
  end

end
