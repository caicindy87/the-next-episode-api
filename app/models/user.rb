class User < ApplicationRecord
  has_secure_password
  has_many :saved_shows
  has_many :reviews, through: :saved_shows
  validates :username, uniqueness: { case_sensitive: false }
end
