class Like < ApplicationRecord
  belongs_to :like
  belongs_to :post

  def update_like_counter
    count = Post.where(:like).count
    self.like.update(likesCounter: count)
  end
end