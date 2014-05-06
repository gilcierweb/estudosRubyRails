require 'test_helper'

class TesteControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get form" do
    get :form
    assert_response :success
  end

end
