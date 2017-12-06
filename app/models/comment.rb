class Comment < ApplicationRecord
  belongs_to :commentor,class_name: 'User'
  has_many :replies, class_name: "Comment" ,foreign_key:"comments_id" 
  belongs_to :comments ,class_name: "Comment",optional: true
  belongs_to :video
  validates :body, presence: true
end
