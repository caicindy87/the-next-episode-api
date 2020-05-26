class RenameImageToImageThumbnailPath < ActiveRecord::Migration[6.0]
  def change
    rename_column :shows, :image, :image_thumbnail_path
  end
end
