class Video < ApplicationRecord
  searchkick word_middle: [:title,:description,:tag_name,:uploader],suggest: [:title,:uploader,:description]
  after_commit :reindex
  has_and_belongs_to_many :tags ,class_name: "Tag"
  belongs_to :uploader,class_name: "User"
  has_many :likes
  has_many :dislikes
  has_many :comments
  has_many :views
  has_many :notification
  mount_uploaders :preview_images,PreviewImagesUploader
  mount_uploader :movie, VideoUploader
  validates :movie, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :tags,presence: true
  def search_data
  	{
  		title: title,
  		description: description,
  		tag_name: tag_name.split(",").join(" "),
  		uploader: [User.find(uploader_id).first_name,User.find(uploader_id).last_name].join(" ") 
  	}
  end
end