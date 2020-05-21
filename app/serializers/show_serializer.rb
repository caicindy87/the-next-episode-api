class ShowSerializer < ActiveModel::Serializer
  attributes :id,:name,:started_date,:ended_date,:network,:country,:image
end
