require "test_helper"

class DeliveriesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get deliveries_top_url
    assert_response :success
  end
end
