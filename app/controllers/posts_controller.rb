class PostsController < ApplicationController
  def index
    @my_post = 'all the posts'
  end

  def show
    @patient = 'show some posts'
  end
end
