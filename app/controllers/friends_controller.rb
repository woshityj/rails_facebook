class FriendsController < ApplicationController
  def index
  end

  def create
    @friend = Friend.new(friend_params)
    @friend.status = "requested"
    if @friend.save
      redirect_to root_path
    else
      render root_path
    end
  end

  def destroy
    @friend = Friend.where(:id => params[:id], :friend_2_id => params[:friend_2_id]).first
    @friend.destroy
    redirect_to root_path
  end

  private
  def friend_params
    params.permit(:friend_1_id, :friend_2_id)
  end
end
