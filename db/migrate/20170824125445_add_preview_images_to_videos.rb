class AddPreviewImagesToVideos < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :preview_images, :json
  end
end
