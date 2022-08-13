class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  def recent_post(user)
    Post.where(user: user).order(created_at: :desc).limit(4)
  end
end
