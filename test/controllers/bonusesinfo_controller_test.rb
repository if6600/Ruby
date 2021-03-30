require 'test_helper'

class BonusesinfoControllerTest < ActionDispatch::IntegrationTest
  test "should get bonusesinfo" do
    get bonusesinfo_bonusesinfo_url
    assert_response :success
  end

end
