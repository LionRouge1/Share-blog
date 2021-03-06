class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(user: @user).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post: @post)
  end
end
