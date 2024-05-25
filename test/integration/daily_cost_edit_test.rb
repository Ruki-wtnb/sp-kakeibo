require "test_helper"

class DailyCostEditTest < ActionDispatch::IntegrationTest

  def setup
    @cost = daily_costs(:cost)
  end

  test "invalid edit" do
    get edit_daily_cost_path(@cost)
    assert_template 'daily_costs/edit'
    patch daily_cost_path(@cost), params: {
      daily_cost: {
        pay_day: "20231116",
        category_id: "a",
        detail: "",
        price: "750"
      } }
    assert_template 'daily_costs/edit'
  end

  test "valid edit" do
    get edit_daily_cost_path(@cost)
    assert_template 'daily_costs/edit'
    pay_day = "2023-11-26"
    price = 1750
    patch daily_cost_path(@cost), params: {
      daily_cost: {
        pay_day: pay_day,
        category_id: 1,
        detail: "ななまがりやおき",
        price: price
      } }
    assert_redirected_to daily_costs_path
    @cost.reload
    assert_equal pay_day, @cost.pay_day.strftime("%Y-%m-%d")
    assert_equal price, @cost.price
    
  end

end
