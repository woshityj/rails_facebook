class PostsController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC")
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
