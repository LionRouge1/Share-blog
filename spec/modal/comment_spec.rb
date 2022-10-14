require 'rails_helper'

RSpec.describe Comment, type: :modal do
  let(:user) { User.create(name: 'Atawu', photo: 'https://unsplash.com/photos/F_ksks', bio: 'Teacher from Ghana.', postsCounter: 0) }
  let(:post) do
    Post.create(user:, title: 'Hello', text: 'This is my first post', commentsCounter: 0, likesCounter: 0)
  end
  let(:comment) { Comment.create(post:, user:, text: 'nice') }

  it 'text should be present' do
    comment.text = nil
    expect(comment).to_not be_valid
  end

  it 'Should update comment counter' do
    comment.update_comment_counter
    expect(post.commentsCounter).to eq(1)
  end
end
