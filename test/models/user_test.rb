require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'users winning probabilty percentage' do
    probabilty = users(:two).winning_probability
    assert_equal probabilty, 50.00
  end

end
