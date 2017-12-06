class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.belongs_to :liker ,index: true
      t.timestamps
    end
  end
end
