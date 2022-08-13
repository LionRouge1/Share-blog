class Like < ApplicationRecord
  belongs_to :like
  belongs_to :post

  def update_like_counter
    count = Post.likes.count
    like.update(likesCounter: count)
  end
end
