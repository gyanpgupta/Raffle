require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { email: 'test@test.com', name: 'Happy', prize: 'watch' } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should not create user without name, email and prize" do
    assert_no_difference('User.count') do
      post users_url, params: { user: { email: nil, name: nil, prize: nil } }
    end
    assert_response :success
  end

  test "should show user" do
    get user_url(users(:one))
    assert_response :success
  end
end
