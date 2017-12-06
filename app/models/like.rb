class Like < ApplicationRecord
	belongs_to :liker,class_name: "User"
	belongs_to :video
end
