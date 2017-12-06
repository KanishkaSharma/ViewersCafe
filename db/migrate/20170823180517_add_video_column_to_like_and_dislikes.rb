class AddVideoColumnToLikeAndDislikes < ActiveRecord::Migration[5.1]
  def change
  	add_reference :likes, :video ,index: true
  	add_reference :dislikes, :video ,index: true
  	add_foreign_key :likes,:videos,index: true
  	add_foreign_key :dislikes,:videos,index:true
  end
end
