class CreateJoinTableVideoTag < ActiveRecord::Migration[5.1]
  def change
  	create_join_table :videos, :tags do |t|
  	end	
  end
end
