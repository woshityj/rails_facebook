class UsersController < ApplicationController
  def index
    if params[:search]
      @friends = {}
      @users = User.where("username LIKE (?)", "%#{params[:search]}%")
      current_user.friends_1.each do |friend|
        @friends[friend.id] = friend.friend_2_id
      end
    end
  end

  def show
    
  end
end
