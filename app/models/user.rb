class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :friends_1, class_name: :Friend, foreign_key: :friend_1_id
  has_many :friends_2, class_name: :Friend, foreign_key: :friend_2_id

  has_many :posts
  has_many :likes
  has_many :comments

  has_one_attached :avatar
end
