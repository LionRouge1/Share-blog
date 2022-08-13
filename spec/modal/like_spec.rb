require 'rails_helper'

RSpec.describe Like, type: :modal do
  let(:user) { User.create(name: 'Atawu', photo: 'https://unsplash.com/photos/F_ksks', bio: 'Teacher from Ghana.', postsCounter: 0) }
  let(:post) do
    Post.create(user: user, title: 'Hello', text: 'This is my first post', commentsCounter: 0, likesCounter: 0)
  end

  let(:like) { Like.create(post: post, user: user) }

  it 'Should update likes counter' do
    like.update_like_counter
    expect(post.likesCounter).to eq(1)
  end
end
