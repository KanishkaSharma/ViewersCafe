class AddTagNameToVideos < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :tag_name, :string
  end
end
