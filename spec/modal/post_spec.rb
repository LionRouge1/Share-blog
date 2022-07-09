require 'rails_helper'

RSpec.describe Post, type: :model do
    let(:user1) { User.create(name: 'Atawu', photo: 'https://unsplash.com/photos/F_ksks', bio: 'Teacher from Ghana.', postsCounter: 0) }

    let(:subject) { Post.create(user: user1, title: 'Hello', text: 'This is my first post', commentsCounter: 0, likesCounter: 0) }

    let(:comment) { Comment.create(user: user1, post: subject, text: 'Very wird')}

    it "title should be present" do
        subject.title = nil
        expect(subject).to_not be_valid
    end

    it "title length should not pass 255" do
        subject.title = 'nillo' * 100
        expect(subject).to_not be_valid
    end

    it 'Comment counter should be a number' do
        subject.commentsCounter = 'no'
        expect(subject).to_not be_valid
    end

    it 'likes counter should be a number' do
        subject.likesCounter = 'no'
        expect(subject).to_not be_valid
    end

    it 'Should update comments counter' do
        subject.update_post_counter
        expect(user1.postsCounter).to eq(1)
    end

    it 'Should show most recent comments' do 
        comments = subject.most_recent_comments
        expect(comments.include?(comment)).to be_truthy
    end
end