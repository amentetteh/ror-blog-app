require_relative '../rails_helper'

RSpec.describe 'Post testing', type: :feature do
  describe 'show page' do
    before(:example) do
      @user1 = User.create(name: 'Amen', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Engineer',
                           posts_counter: 1)
      @user2 = User.create(name: 'Sebastian', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Engineer',
                           posts_counter: 1)
      @post = Post.create(title: 'LM', text: 'My Nth Post', comments_counter: 2, likes_counter: 1, author: @user1)
      @first_comment = Comment.create(text: 'First comment', author: @user1, post: @post)
      @second_comment = Comment.create(text: 'Second comment', author: @user2, post: @post)
      Like.create(author: @user1, post: @post)
      visit user_post_path(user_id: @user1.id, id: @post.id)
    end
    it 'should render post title' do
      expect(page).to have_content(@post.title)
    end
    it 'should render post author name' do
      expect(page).to have_content(@post.author.name)
    end

    it 'should render the number of comments' do
      expect(page).to have_content(@post.comments_counter)
    end

    it 'should render the number of likes' do
      expect(page).to have_content(@post.likes_counter)
    end

    it 'should render post text' do
      expect(page).to have_content(@post.text)
    end

    it 'should render name of commenters' do
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
    end

    it 'should render content of comments' do
      expect(page).to have_content(@first_comment.text)
      expect(page).to have_content(@second_comment.text)
    end
  end
end
