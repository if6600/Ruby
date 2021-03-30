require 'test_helper'

class BonusespopularControllerTest < ActionDispatch::IntegrationTest
  test "should get bonusespopular" do
    get bonusespopular_bonusespopular_url
    assert_response :success
  end

end
