# frozen_string_literal: true

require 'test_helper'

class ShoppingControllerTest < ActionDispatch::IntegrationTest
  test 'should get top' do
    get shopping_top_url
    assert_response :success
  end
end
