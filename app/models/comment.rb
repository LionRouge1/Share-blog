class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def update_comment_counter
    count = Comment.where(user: :user).count
    post.update(commentsCounter: count)
  end
end
