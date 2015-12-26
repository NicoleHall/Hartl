require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get signup" do
    get :signup
    assert_response :success
    assert_select "title", "Ruby on Rails Tutorial Sample App"


  end

end
