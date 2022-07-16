class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(user: @user).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post: @post)
  end

  def new
    @post = Post.new
    @user = User.find(params[:user_id])
  end

  def create
    @post = Post.create(post_params)
    @post.user = @user
    @post.likesCounter = 0
    @post.commentsCounter = 0

    if @post.save
      redirect_to user_posts_path(@post.user, @post), notice: 'New post created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
