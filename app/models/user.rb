class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :users, class_name: :Friend, foregin_key: :user_id
  has_many :friends, class_name: :Friend, foregin_key: :friend_id
end
