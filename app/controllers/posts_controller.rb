class PostsController < ApplicationController
  def index
    @posts = Post.where("user_id LIKE (?)", "%#{current_user.id}%").order("created_at DESC").all
    current_user.friends_1.each do |friend|
      if friend.status == "accepted"
        friend_posts = Post.where("user_id LIKE (?)", "%#{friend.friend_2_id}%").all
        @posts = @posts.or(friend_posts)
      end
    end
    current_user.friends_2.each do |friend|
      if friend.status == "accepted"
        friend_posts = Post.where("user_id LIKE (?)", "%#{friend.friend_1_id}%").all
        @posts = @posts.or(friend_posts)
      end
    end
    @current_user_liked_posts = {}
    current_user.likes.each do |liked_post|
      @current_user_liked_posts[liked_post.id] = liked_post.post_id
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render root_path
    end
  end

  private
  def post_params
    params.permit(:post, :user_id)
  end
end
