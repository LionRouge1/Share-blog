require 'rails_helper'

RSpec.describe User, type: :model do
    subject { User.new(name: 'Harry', photo: 'photo/link.com', bio: 'description', postsCounter: 0)}

    before { subject.save}
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
end