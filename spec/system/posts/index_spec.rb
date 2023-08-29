require 'rails_helper'

describe 'Post index page', type: :system do
  describe 'checks the content of the posts#index page' do
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
      @comment2 = Comment.create!(text: 'Awesome Tom!', author: @user2, post: @post2)

      @like1 = Like.create!(author: @user1, post: @post1)
    end

    it "expects to see the user's profile picture" do
      visit user_posts_path(@user3)

      expect(page).to have_css("img[src*='#{@user3.photo}']")
    end

    it "expects to see the user's username" do
      visit user_posts_path(@user3)

      expect(page).to have_content(@user3.name)
    end

    it 'expects to see the number of posts the user has written' do
      visit user_posts_path(@user3)

      expect(page).to have_content("Number of posts: #{@user3.posts.size}")
    end

    it "expects to see a post's title" do
      visit user_posts_path(@user1)

      expect(page).to have_content(@post1.title)
    end

    it "expects to see some of the post's body" do
      visit user_posts_path(@user1)

      expect(page).to have_content(@post1.text)
    end

    it 'expects to see the first comment on a post' do
      visit user_posts_path(@user1)

      expect(page).to have_content(@comment1.text)
    end

    it 'expects to see how many comments a post has' do
      visit user_posts_path(@user1)

      expect(page).to have_content("Comments #{@post1.comments.size}")
    end

    it 'expects to see how many likes a post has' do
      visit user_posts_path(@user1)

      expect(page).to have_content("Likes #{@post1.likes.size}")
    end

    it 'expects to see a section for pagination if there are more posts than fit on the view' do
      visit user_posts_path(@user1)

      expect(page).to have_content('Pagination')
    end

    it "expects on click on a post, it redirects me to that post's show page" do
      visit user_posts_path(@user1)

      click_link @post1.title
      expect(page).to have_current_path(post_path(@post1))
    end
  end
end
