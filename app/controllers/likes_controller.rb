class LikesController < ApplicationController

    def create
        @like = Like.new(:user_id => current_user.id, :post_id => params[:post_id])
        if @like.save
            redirect_to root_path
        else
            render root_path
        end
    end

    def destroy
        @like = Like.where(:id => params[:id]).first
        @like.destroy
        redirect_to root_path
    end
end
