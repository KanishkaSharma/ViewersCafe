class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.belongs_to :commentor 
      t.text :body
      t.belongs_to :comments
      t.belongs_to :video
      t.timestamps
    end
  end
end
