class AddIndexToVideo < ActiveRecord::Migration[5.1]
  def change
  	add_index :users , :first_name
  	add_index :users , :last_name
  	add_index :videos , :title
  	add_index :videos , :tag_name
  	 
  end
end
