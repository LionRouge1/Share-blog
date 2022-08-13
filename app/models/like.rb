class Like < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  belongs_to :post, class_name: 'Post', foreign_key: :post_id

  after_save :update_like_counter

  def update_like_counter
    post.update(likesCounter: post.likes.count)
  end
end
