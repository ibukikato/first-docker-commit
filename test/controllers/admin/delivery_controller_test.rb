require "test_helper"

class Admin::DeliveryControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get admin_delivery_top_url
    assert_response :success
  end
end
