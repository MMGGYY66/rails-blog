require 'rails_helper'

describe 'Users show page', type: :system do
  describe 'checks the content of the users#show page' do
    before(:each) do
      @user3 = User.create(name: 'Hana', photo: 'https://livewiredemos.com/images/avatar.png', bio: 'Doctor from PEgypt.')
      @post1 = Post.create!(title: 'Hello', text: 'here is my first post', author: @user3)
      @post3 = Post.create!(title: 'Hello', text: 'here is my third post.', author: @user3)
      @post4 = Post.create!(title: 'fourth post', text: 'here is my fourth post.', author: @user3)
      @post5 = Post.create!(title: 'fifth post', text: 'here is my fifth post.', author: @user3)
    end

    it "expects to show the user's profile picture" do
      visit user_path(@user3)

      expect(page).to have_css("img[src*='#{@user3.photo}']")
    end

    it "expects to see the user's username" do
      visit user_path(@user3)

      expect(page).to have_content(@user3.name)
    end

    it 'expects to see the number of posts the user has written' do
      visit user_path(@user3)

      expect(page).to have_content("Number of posts: #{@user3.posts.size}")
    end

    it "expects to see the user's bio" do
      visit user_path(@user3)

      expect(page).to have_content(@user3.bio)
    end

    it "expects to see the user's first 3 posts" do
      visit user_path(@user3)

      expect(page).to have_content(@post1.title)
      expect(page).to have_content(@post3.title)
      expect(page).not_to have_content(@post4.title)
      expect(page).to have_content(@post5.title)
    end

    it "expects to see a button that lets me view all of a user's posts" do
      visit user_path(@user3)

      expect(page).to have_link('See all posts', class: 'btn')
    end

    it "expects on click user's post, it redirects to that post's show page" do
      visit user_path(@user3)

      click_link @post1.title
      expect(page).to have_current_path(post_path(@post1))
    end

    it "expects on click to see all posts, it redirects to the user's post's index page" do
      visit user_path(@user3)

      click_link 'See all posts'
      expect(page).to have_current_path(user_posts_path(@user3))
    end
  end
end