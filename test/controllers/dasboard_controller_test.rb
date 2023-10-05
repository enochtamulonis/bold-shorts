require "test_helper"

class DasboardControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get dasboard_show_url
    assert_response :success
  end
end
