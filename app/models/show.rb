class Show < ApplicationRecord
  has_many :saved_shows
  has_many :reviews, through: :saved_shows
end
