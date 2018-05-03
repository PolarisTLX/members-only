class User < ApplicationRecord
  attr_accessor :remember_token

  validates :username, presence: true, length: {minimum: 4, maximum: 25 }
  validates :password, presence: true, length: {minimum: 8, maximum: 25 }, allow_nil: true
  # validates :password, presence: true, length: {minimum: 8, maximum: 25 }
  has_secure_password  # this takes care of checking the password_confirmation

  has_many :posts, dependent: :destroy
  # dependent: :destroy means that is a user is deleted, so will all the posts they created be deleted


  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end
