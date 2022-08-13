class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def update_comment_counter
    post.update(commentsCounter: post.comments.count)
  end
end
