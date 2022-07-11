class PostsController < ApplicationController
  def index
    @my_post = ['First post', 'second post', 'I think it\'s okay']
  end

  def show
    @patient = Post.find(params[:id])
  end
end
