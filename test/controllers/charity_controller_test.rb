require 'test_helper'

class CharityControllerTest < ActionDispatch::IntegrationTest
  test "should get charity" do
    get charity_charity_url
    assert_response :success
  end

end
