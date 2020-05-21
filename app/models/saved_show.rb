class SavedShow < ApplicationRecord
  belongs_to :show
  belongs_to :user
  has_many :reviews
end
