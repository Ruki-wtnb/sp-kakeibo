require "test_helper"

class DailyCostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get daily_costs_path
    assert_response :success
  end

  # test "should get show" do
  #   get daily_costs_show_url
  #   assert_response :success
  # end

  test "should get new" do
    get new_daily_cost_path
    assert_response :success
  end

  test "should get create" do
    post daily_costs_path
    assert_response :success
  end
end
