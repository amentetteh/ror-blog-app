require_relative '../rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Alice', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher', posts_counter: 0)
  post = Post.create(title: 'Novel Resume', text: 'Lorem ipsum', comments_counter: 0, likes_counter: 0, author: user)
  subject { Comment.new(text: 'Hello everyone', author: user, post:) }

  before { subject.save }

  it 'comments counter should be 1' do
    expect(post.comments_counter).to eq 1
  end

  it 'should not valid without an author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'should not valid without a post' do
    subject.post = nil
    expect(subject).to_not be_valid
  end
end
