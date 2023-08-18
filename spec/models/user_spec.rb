require 'rails_helper'

describe User, type: :model do
  it 'not valid if name is nil' do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end

  it 'not valid if posts_counter is not an integer >= 0' do
    user = User.new(posts_counter: -1)
    expect(user).to_not be_valid
  end

  it 'Valid if posts_counter is an integer >= 0' do
    user = User.new(name: 'test', posts_counter: 0)
    expect(user).to be_valid
  end

  it '#last_3_posts' do
    user = User.create!(name: 'Mohamed', posts_counter: 0)
    Post.create!(title: 'one', comments_counter: 1, likes_counter: 1, author: user)
    Post.create!(title: 'two', comments_counter: 1, likes_counter: 1, author: user)
    Post.create!(title: 'three', comments_counter: 1, likes_counter: 1, author: user)
    Post.create!(title: 'four', comments_counter: 1, likes_counter: 1, author: user)
    posts = user.last_3_posts
    expect(posts.size).to eq(3)
  end
end
