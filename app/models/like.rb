class Like < ApplicationRecord
  belongs_to :like
  belongs_to :post

  def update_like_counter
    post.update(likesCounter: post.likes.count)
  end
end
