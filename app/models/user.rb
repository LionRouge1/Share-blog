class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  def recent_post
    posts.order(created_at: :desc).limit(3)
  end

  validates :name, presence: true, length: { in: 2..100, message: 'Should be in range of 2 to 100' }
end
