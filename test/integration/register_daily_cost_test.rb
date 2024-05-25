require "test_helper"

class RegisterDailyCostTest < ActionDispatch::IntegrationTest

  def setup
    @cost = daily_costs(:cost)
  end

  test "invalid registration" do
    # 日々の出費の数が変わらないことを検証
    assert_no_difference 'DailyCost.count' do
      # 登録画面にアクセス
      get new_daily_cost_path

      post daily_costs_path, params: { daily_cost: {
        pay_date: "20231210",
        category_id: "",
        detail: "つきあたりみぎ野菜",
        price: 735
      }}

      assert_response :unprocessable_entity
      assert_template 'daily_costs/new'
      assert_select 'div.alert-danger'
    end
  end

  test "valid registration" do
    assert_difference 'DailyCost.count', 1 do
      # 登録画面にアクセス
      get new_daily_cost_path
      assert_template 'daily_costs/new'

      post daily_costs_path, params: { daily_cost: {
        pay_date: "2023-12-10",
        category_id: "1",
        detail: "つきあたりみぎ野菜",
        price: 735
        }}

      assert_response :success
      assert_template 'daily_costs/new'
    end
  end

  test "delete daily cost difference" do
    assert_difference 'DailyCost.count', -1 do
      delete daily_cost_path(@cost)
    end
  end

  test "delete daily cost no difference" do
    assert_no_difference 'DailyCost.count' do
      post daily_costs_path(params: { daily_cost: {
        pay_date: "2023-12-10",
        category_id: "1",
        detail: "つきあたりみぎ野菜",
        price: 735
        }})
      delete daily_cost_path(@cost)
    end
  end

end
