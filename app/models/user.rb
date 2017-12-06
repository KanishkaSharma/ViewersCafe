class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable,:omniauthable
  Role = [:admin, :writer, :viewer]
  enum role: Role
  has_many :comments
  has_many :videos
  has_many :likes
  has_many :dislikes
  has_many :views
  has_many :subscriptions
  has_many :notifications ,as: :recipient
  has_one :channel
  mount_uploader :profile_picture, ProfilePictureUploader
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :profile_picture,presence: true
  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(first_name: data["first_name"],
          last_name: data["last_name"],
          provider: access_token.provider,
          email: data["email"],
          uid: access_token.uid ,
          password: Devise.friendly_token[0,20],
          remote_profile_picture_url: data["image"]
        )
      end
    end
  end
  def self.find_for_facebook(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else

        first_name,last_name = data["name"].split(" ")
        user = User.create(first_name: first_name,
          last_name: last_name,
          provider: access_token.provider,
          email: data["email"],
          uid: access_token.uid ,
          remote_profile_picture_url: data["image"].gsub('http://','https://'),
          password: Devise.friendly_token[0,20]
        )
      end
    end
  end
end