require 'test_helper'

class WebhookControllerTest < ActionController::TestCase
  test "should get onhook" do
    get :onhook
    assert_response :success
  end

end
