class UsersController < ApplicationController
  def index
    if params[:search]
      @friends = {}
      @users = User.where("username LIKE (?)", "%#{params[:search]}%")
      current_user.friends_1.each do |friend|
        @friends[friend.id] = friend.friend_2_id
      end
      current_user.friends_2.each do |friend|
        @friends[friend.id] = friend.friend_1_id
      end
    end
  end

  def show
    @user = User.find(current_user.id)
    @current_user_liked_posts = {}
    current_user.likes.each do |liked_post|
      @current_user_liked_posts[liked_post.id] = liked_post.post_id
    end
  end
end
