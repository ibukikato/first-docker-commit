require "test_helper"

class Admin::DeliveriesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get admin_deliveries_top_url
    assert_response :success
  end
end
