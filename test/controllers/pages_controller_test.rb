require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get manual" do
    get pages_manual_url
    assert_response :success
  end

  test "should get responselist" do
    get pages_responselist_url
    assert_response :success
  end

end
