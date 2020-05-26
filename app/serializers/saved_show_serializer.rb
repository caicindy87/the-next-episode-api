class SavedShowSerializer < ActiveModel::Serializer
  attributes :id, :rating
  belongs_to :show
  belongs_to :user
  has_many :reviews
end
