require 'rails_helper'

describe 'Post show page', type: :system do
  describe 'checks the content of the posts#show page' do
    before(:each) do
      @user1 = User.create(name: 'Tom',
                           photo: 'https://cdn1.vectorstock.com/i/1000x1000/31/95/user-sign-icon-person-symbol-human-avatar-vector-12693195.jpg', bio: 'Teacher from Mexico.')
      @user2 = User.create(name: 'Lilly',
                           photo: 'https://w7.pngwing.com/pngs/4/736/png-transparent-female-avatar-girl-face-woman-user-flat-classy-users-icon-thumbnail.png', bio: 'Teacher from Poland.')
      @user3 = User.create(name: 'Hana', photo: 'https://livewiredemos.com/images/avatar.png',
                           bio: 'Doctor from PEgypt.')
      @post1 = Post.create!(title: 'Hello', text: 'here is my first post', author: @user3)
      @post3 = Post.create!(title: 'Hello', text: 'here is my third post.', author: @user3)
      @post4 = Post.create!(title: 'fourth post', text: 'here is my fourth post.', author: @user3)
      @post5 = Post.create!(title: 'fifth post', text: 'here is my fifth post.', author: @user3)

      @comment1 = Comment.create!(text: 'Hi Tom!', author: @user2, post: @post1)
      @comment2 = Comment.create!(text: 'Awesome Tom!', author: @user3, post: @post3)
      @comment3 = Comment.create!(text: 'Awesome!', author: @user1, post: @post1)
    end

    it "expects to see the post's title" do
      visit post_path(@post5)

      expect(page).to have_content(@post5.title)
    end

    it 'expects to see who wrote the post' do
      visit post_path(@post5)

      expect(page).to have_content("Post by #{@post5.author.name}")
    end

    it 'expects to see how many comments it has' do
      visit post_path(@post5)

      expect(page).to have_content("Comments #{@post5.comments.size}")
    end

    it 'expects to see how many likes it has' do
      visit post_path(@post5)

      expect(page).to have_content("Likes #{@post5.likes.size}")
    end

    it 'expects to see the post body' do
      visit post_path(@post5)

      expect(page).to have_content(@post5.text)
    end

    it 'expects to see the username of each commentor' do
      visit post_path(@post1)

      expect(page).to have_content(@comment1.author.name)
      expect(page).to have_content(@comment2.author.name)
    end

    it 'expects to see the comment each commentor left' do
      visit post_path(@post1)

      expect(page).to have_content(@comment1.text)
      expect(page).to have_content(@comment3.text)
    end
  end
end
