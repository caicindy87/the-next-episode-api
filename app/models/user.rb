class User < ApplicationRecord
  has_secure_password
  has_many :saved_shows
  has_many :reviews, through: :saved_shows

  validates :username, presence: true, length: {minimum: 5, maximum: 50},
  uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: {minimum: 5}, allow_nil: true
end
