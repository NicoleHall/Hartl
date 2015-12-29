require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid user signups do not create record in db" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name:  "",
                               email: "user@invalid",
                               password:              "foo",
                               password_confirmation: "bar" }
    end
    assert_template 'users/new'
  end
end