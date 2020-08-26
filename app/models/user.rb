class User < ApplicationRecord

    #FOLLOWED USERS
  has_many :active_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy 
  has_many :followed_users, through: :active_relationships, source: :followed

    #FOR FOLLOWERS
  has_many :passive_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

    #FOR LESSONS
  has_many :lessons, dependent: :destroy
  has_many :answers, through: :lessons
  
    #FOR ACTIVITY
  has_many :activities, dependent: :destroy 
  
  #Validations
  validates :name, presence: true, length: { minimum: 3 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum:6 }, allow_nil: true

    #for the Avatar
  mount_uploader :avatar, AvatarUploader

    #methods for this specific user
  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end

  def follow(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
end
