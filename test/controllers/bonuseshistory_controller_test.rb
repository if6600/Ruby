require 'test_helper'

class BonuseshistoryControllerTest < ActionDispatch::IntegrationTest
  test "should get bonuseshistory" do
    get bonuseshistory_bonuseshistory_url
    assert_response :success
  end

end
