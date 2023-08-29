require 'rails_helper'

describe 'Users index page', type: :system do
  describe 'checks the content of the users#index page' do
    before(:each) do
      @user1 = User.create(name: 'Tom',
                           photo: 'https://cdn1.vectorstock.com/i/1000x1000/31/95/user-sign-icon-person-symbol-human-avatar-vector-12693195.jpg', bio: 'Teacher from Mexico.')
      @user2 = User.create(name: 'Lilly',
                           photo: 'https://w7.pngwing.com/pngs/4/736/png-transparent-female-avatar-girl-face-woman-user-flat-classy-users-icon-thumbnail.png', bio: 'Teacher from Poland.')
      @user2 = User.create(name: 'Hana', photo: 'https://livewiredemos.com/images/avatar.png',
                           bio: 'Doctor from PEgypt.')

      @post1 = Post.create(title: 'Hello', text: 'here is my first post', author: @user3)
      @post2 = Post.create(title: 'Welcome’, text: Nice to see you', text: nil, author: @user3)
      @post3 = Post.create(title: 'Hello', text: 'here is my third post.', author: @user3)
    end

    it 'expects to see the username of all other users' do
      visit root_path

      expect(page).to have_content('Tom')
      expect(page).to have_content('Lilly')
      expect(page).to have_content('Hana')
    end

    it 'expects to see the profile picture for each user' do
      visit root_path

      expect(page).to have_css("img[src*='#{@user1.photo}']")
      expect(page).to have_css("img[src*='#{@user2.photo}']")
    end

    it 'expects to see the number of posts each user has written' do
      visit root_path

      expect(page).to have_content("Number of posts: #{@user1.posts.size}")
      expect(page).to have_content("Number of posts: #{@user2.posts.size}")
    end

    it "expects on click on a user to redirect to that user's show page" do
      visit root_path

      click_link 'Tom'
      expect(page).to have_current_path(user_path(@user1))
    end
  end
end
