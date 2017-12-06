class CreateViews < ActiveRecord::Migration[5.1]
  def change
    create_table :views do |t|
      t.belongs_to :viewer,index: true
      t.belongs_to :video,index: true
      t.timestamps
    end
  end
end
