class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :spoiler, :content
  belongs_to :saved_show
end
