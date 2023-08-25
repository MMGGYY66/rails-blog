class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @current_user = current_user
    @comment = @current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to post_path(@comment.post)
    else
      @post = Post.find(params[:post_id])
      redirect_to post_path(@post)
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
