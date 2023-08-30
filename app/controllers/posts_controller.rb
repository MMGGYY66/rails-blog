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
    @user = User.find(params[:user_id])
    @post = Post.new(author: current_user, **post_params)

    if @post.save
      redirect_to post_path(@post), notice: 'Post was successfully created.'
    else
      flash.now[:error] = 'Failed to create the post.'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
