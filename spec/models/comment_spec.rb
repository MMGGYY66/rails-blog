require 'rails_helper'

describe Comment, type: :model do
  it 'Update_post_comments_counter' do
    author = User.create!(name: 'Youssef', posts_counter: 0)
    post = Post.create!(title: 'My post', comments_counter: 1, likes_counter: 1, author:)
    Comment.create!(post:, author:)
    expect(post.comments_counter).to eq(2)
  end
end
