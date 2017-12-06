class AddForeignKeysToVariousTables < ActiveRecord::Migration[5.1]
  def change
  	add_foreign_key :comments, :comments, column: :comments_id
  	add_foreign_key :videos, :users, column: :uploader_id
  	add_foreign_key :comments, :videos ,column: :video_id
  	add_foreign_key :views, :users, column: :viewer_id
  	add_foreign_key :views,:videos,column: :video_id
  	add_foreign_key :likes,:users,column: :liker_id
  	add_foreign_key :dislikes,:users,column: :disliker_id
  	add_foreign_key :comments,:users,column: :commentor_id
  end
end
