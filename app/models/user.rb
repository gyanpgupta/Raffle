class User < ApplicationRecord

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :prize, presence: true

  PRIZE = %w[watch luxury_dinner weekend_to_hotel].freeze

  def winning_probability
    (1.0 / users_count) * 100
  end

  def users_count
    User.where(prize: prize).size
  end
end
