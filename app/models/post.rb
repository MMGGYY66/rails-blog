class Post < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: 'User'
  has_many :comments
  has_many :likes

  after_create :update_posts_counter

  def recent_comments
    comments.where(post_id: id).limit(5).order(created_at: :desc)
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
