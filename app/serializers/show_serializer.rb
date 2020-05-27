class ShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_date, :end_date, :status, :network, :country, :image_thumbnail_path
end
