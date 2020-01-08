require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'users winning probabilty percentage' do
    probabilty = users(:two).winning_probability
    assert_equal probabilty, 50.00
  end

  test 'should give the count of user with choosen prize' do
    assert_equal users(:two).users_count, 2
  end

  # negative test cases
  test 'should not create user if name not present' do
    user = User.new(email: 'test@test.com', prize: 'watch')
    assert_not user.save
    
    error = user.errors.full_messages_for(:name)[0]
    assert_equal error, "Name can't be blank"
  end

  test 'should not create user if email not present' do
    user = User.new(name: 'test', prize: 'watch')
    assert_not user.save
    
    error = user.errors.full_messages_for(:email)[0]
    assert_equal error, "Email can't be blank"
  end

  test 'should not create user if prize not present' do
    user = User.new(name: 'test', email: 'test@test.com')
    assert_not user.save
    
    error = user.errors.full_messages_for(:prize)[0]
    assert_equal error, "Prize can't be blank"
  end

  test 'should not create user if email is not unique' do
    user = User.new(name: 'test', email: users(:one).email, prize: 'watch')
    assert_not user.save
    
    error = user.errors.full_messages_for(:email)[0]
    assert_equal error, "Email has already been taken"
  end
end
