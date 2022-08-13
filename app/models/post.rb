class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def update_post_counter
    count = Post.where(user: :user).count
    user.update(postsCounter: count)
  end

  def most_recent_comments(post)
    Comment.where(post: post).order(created_at: :desc).limit(6)
  end
end
