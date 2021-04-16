require 'test_helper'

class BoughtsControllerTest < ActionDispatch::IntegrationTest
  test "should get checked" do
    get boughts_checked_url
    assert_response :success
  end

end
