class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_save :update_post_counter

  def update_post_counter
    user.update(postsCounter: user.posts.count)
  end

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  validates :title, presence: true, length: { maximum: 255,
                                              too_long: '255 characters is the maximum allowed' }
  validates :commentsCounter, numericality: { only_integer: true,
                                              greater_than_or_equal_to: 0 }
  validates :likesCounter, numericality: { only_integer: true,
                                           greater_than_or_equal_to: 0 }
end
