class User < ApplicationRecord
  require 'open-uri'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  
  has_many :friends_1, class_name: :Friend, foreign_key: :friend_1_id
  has_many :friends_2, class_name: :Friend, foreign_key: :friend_2_id

  has_many :posts
  has_many :likes
  has_many :comments

  has_one_attached :avatar

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.username = auth.info.name
      user.name = auth.info.name   # assuming the user model has a name
      url = URI.parse(auth.info.image)
      filename = File.basename(url.path)
      file = URI.open(url)
      user.avatar.attach(io: file, filename: filename)
    end
  end
  
  after_create :send_email
  def send_email
    UserMailer.welcome_email(self).deliver
  end
end
