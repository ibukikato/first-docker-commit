require "test_helper"

class DeliveryControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get delivery_top_url
    assert_response :success
  end
end
