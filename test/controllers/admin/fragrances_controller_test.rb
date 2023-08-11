require "test_helper"

class Admin::FragrancesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_fragrances_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_fragrances_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_fragrances_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_fragrances_edit_url
    assert_response :success
  end
end
