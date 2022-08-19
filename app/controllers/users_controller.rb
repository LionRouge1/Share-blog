class UsersController < ApplicationController
  def index
    # fetch all the users from the database
    @users = User.all
  end

  def show
    # find user base on params
    @user = User.find(params[:id])
    @posts = Post.where(user: @user)
  end
end
