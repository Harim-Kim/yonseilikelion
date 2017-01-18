require 'test_helper'

class ChangminControllerTest < ActionDispatch::IntegrationTest
  test "should get board" do
    get changmin_board_url
    assert_response :success
  end

end
