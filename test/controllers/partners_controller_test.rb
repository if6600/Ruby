require 'test_helper'

class PartnersControllerTest < ActionDispatch::IntegrationTest
  test "should get partners" do
    get partners_partners_url
    assert_response :success
  end

end
