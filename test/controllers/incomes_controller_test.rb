require "test_helper"

class IncomesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_income_path
    assert_response :success
    assert_select "form"
  end
end
