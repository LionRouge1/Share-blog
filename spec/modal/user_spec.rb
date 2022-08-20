require 'rails_helper'

RSpec.describe User, type: :model do
  # spec test for user
  subject do
    User.new(name: 'Harry', photo: 'photo/link.com', bio: 'description', postsCounter: 0)
  end
  let(:post) do
    Post.create(user: subject, title: 'Hello', text: 'This is my first post', commentsCounter: 0, likesCounter: 0)
  end

  before do
    subject.save
  end

  it 'User name should be present' do
    subject.name = 'Harry'
    expect(subject).to be_valid
  end

  it 'name should be in range of 2 to 150' do
    subject.name = 't'
    expect(subject).to_not be_valid
  end

  it 'PostsCounter should be an integer greater than or equal to zero' do
    subject.postsCounter = 'counter'
    expect(subject).to_not be_valid
  end

  it 'Should sho most recent posts' do
    posts = subject.recent_post
    expect(posts.include?(post)).to be_truthy
  end
end
