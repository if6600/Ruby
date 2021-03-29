require 'test_helper'

class BonusControllerTest < ActionDispatch::IntegrationTest
  test "should get bonuses" do
    get bonus_bonuses_url
    assert_response :success
  end

end
