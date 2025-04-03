class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
        @commentable = find_commentable
        @comment = @commentable.comments.build(comment_params)
        @comment.user = current_user

        if @comment.save
            redirect_to @commentable, notice: "Comment added successfully!"
        else
            redirect_to @commentable, alert: "Failed to add comment."
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        if @comment.user == current_user
            @comment.destroy
            redirect_back fallback_location: root_path, notice: "Comment deleted!"
        else
            redirect_back fallback_location: root_path, alert: "Not authorized!"
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end

    def find_commentable
        if params[:post_id]
            Post.find(params[:post_id])
        elsif params[:article_id]
            Article.find(params[:article_id])
        end
    end
end
