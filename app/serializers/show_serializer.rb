class ShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :started_date, :ended_date, :status, :network, :country, :image_thumbnail_path
end
