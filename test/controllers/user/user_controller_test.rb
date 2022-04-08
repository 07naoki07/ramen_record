require "test_helper"

class User::UserControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_user_show_url
    assert_response :success
  end
end
