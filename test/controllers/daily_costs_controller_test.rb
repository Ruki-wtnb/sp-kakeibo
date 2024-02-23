require "test_helper"

class DailyCostsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @income = Income.new(price: 200000, year_month: "2024-01")
  end
  
  test "should get index" do
    get daily_costs_path
    assert_response :success
    assert_select "table"
  end

  test "should get new" do
    get new_daily_cost_path
    assert_response :success
    assert_select "form"
  end

end
