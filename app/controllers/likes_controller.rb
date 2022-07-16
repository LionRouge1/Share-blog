class LikesController < ApplicationController
    def create
        @user = @user
        @post = Post.includes(:user).find(params[:post_id])
    
        @already_liked = Like.where(user: @user, post: @post)
        destroy && return if @already_liked.present?
    
        @like = Like.create(likes_params)
        @like.user = @user
        @like.post = @post
    
        if @like.save
          redirect_back_or_to user_post_path(@post.user, @post), notice: 'Successfully liked post.'
        else
          flash[:alert] = 'Something went wrong'
        end
      end
    
      def destroy
        @like = @user.likes.last
        @like.destroy
        @post = @like.post
        flash[:notice] = 'You unliked this post.'
        redirect_back_or_to user_post_path(@post.user, @post)
      end
    
      private
    
      def likes_params
        params.permit(:author_id, :id)
      end
end
