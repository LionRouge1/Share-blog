class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = Comment.create(comment_params)
    @comment.user = @user
    @post = Post.find(params[:post_id])
    @comment.post = @post
    puts 'tototo'
    if @comment.save
      redirect_to user_post_path(@user.id, @post.id), notice: 'comment added successfully'
    else
      redirect_to user_post_path(@user.id, @post.id), alert: 'Comment failed to save.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
