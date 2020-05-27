class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :spoiler, :content, :created_at
  belongs_to :saved_show
end
