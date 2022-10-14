class UsersController < ApplicationController
  def index
    @users = User.all.order(postsCounter: :desc)
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user: @user).order(created_at: :desc)
  end
end
