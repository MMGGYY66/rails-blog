class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.includes(:author, comments: :author, likes: :author).find(params[:id])
  end

  def create
    @post = @current_user.posts.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post }
      else
        format.html { render :new }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
