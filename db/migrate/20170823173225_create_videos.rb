class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.belongs_to :uploader,index: true
      t.boolean :published
      t.timestamps
    end
  end
end
