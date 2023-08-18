require 'rails_helper'

describe Post, type: :model do
  author = User.new(name: 'Yahya')

  describe 'Title' do
    it 'not valid if blank' do
      post = Post.new(title: nil, comments_counter: 1, likes_counter: 1, author:)
      expect(post).to_not be_valid
    end

    it 'valid if not blank' do
      post = Post.new(title: 'Yahya', comments_counter: 1, likes_counter: 1, author:)
      expect(post).to be_valid
    end

    it 'not valid if exceeds 250 characters' do
      post = Post.new(title: 'a' * 291, comments_counter: 1, likes_counter: 1, author:)
      expect(post).to_not be_valid
    end
  end

  describe 'CommentsCounter' do
    it 'not valid if it is not an integer >= 0' do
      post = Post.new(title: 'Yahya', comments_counter: -1, likes_counter: 1, author:)
      expect(post).to_not be_valid
    end

    it 'valid if it is an integer >= 0' do
      post = Post.new(title: 'Yahya', comments_counter: 0, likes_counter: 1, author:)
      expect(post).to be_valid
    end
  end

  describe 'LikesCounter' do
    it 'not valid if it is not an integer >= 0' do
      post = Post.new(title: 'Yahya', comments_counter: 1, likes_counter: -1, author:)
      expect(post).to_not be_valid
    end

    it 'valid if it is an integer >= 0' do
      post = Post.new(title: 'Yahya', comments_counter: 1, likes_counter: 0, author:)
      expect(post).to be_valid
    end
  end

  it '#last_5_comments' do
    user = User.create!(name: 'Yahya', posts_counter: 0)
    post = Post.create!(title: 'first post', comments_counter: 1, likes_counter: 1, author: user)
    Comment.create!(text: 'first comment', author: user, post:)
    Comment.create!(text: 'second comment', author: user, post:)
    Comment.create!(text: 'third comment', author: user, post:)
    Comment.create!(text: 'fourth comment', author: user, post:)
    Comment.create!(text: 'fifth comment', author: user, post:)
    Comment.create!(text: 'sixth comment', author: user, post:)
    comments = post.last_5_comments
    expect(comments.size).to eq(5)
  end

  it 'update_author_posts_counter' do
    author = User.create!(name: 'Yahya', posts_counter: 0)
    Post.create!(title: 'first post', comments_counter: 1, likes_counter: 1, author:)
    expect(author.posts_counter).to eq(1)
  end
end
