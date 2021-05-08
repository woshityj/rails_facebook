class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        if @comment.save
            redirect_to root_path
        else
            render root_path
        end
    end

    private
    def comment_params
        params.permit(:comment, :post_id, :user_id)
    end
end
