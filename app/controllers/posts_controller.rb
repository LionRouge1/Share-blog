class PostsController < ApplicationController
  def index
    @my_post = ['First post', 'second post', 'I think it\'s okay']
  end

  def show
    @patient = 'Some text here'
  end
end
