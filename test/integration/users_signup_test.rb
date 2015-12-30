require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid user signups do not create record in db" do
    before_count = User.all.count
    get signup_path
    post users_path, user: { name:  "",
                             email: "user@invalid",
                             password:              "foo",
                             password_confirmation: "bar" }
    after_count = User.all.count
    assert_equal before_count, after_count
    assert_template 'users/new'
  end

  test "A valid user is added to the databas" do
    before_count = User.all.count
    get signup_path
    post users_path, user: { name:  "nicole hall",
                             email: "user@valid.gmail.com",
                              password:              "password",
                              password_confirmation: "password" }
    after_count = User.all.count
    assert_equal 0, before_count
    assert_equal 1, after_count
  end
end
