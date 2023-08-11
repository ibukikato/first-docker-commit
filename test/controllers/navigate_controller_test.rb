# frozen_string_literal: true

require 'test_helper'

class NavigateControllerTest < ActionDispatch::IntegrationTest
  test 'should get top' do
    get navigate_top_url
    assert_response :success
  end
end
