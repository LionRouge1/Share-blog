class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  def recent_post
    posts.order(created_at: :desc).limit(3)
  end

  validates :name, presence: true, length: { in: 2..150, message: 'Should be in range of 2 to 150'}
  validates :postsCounter, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
