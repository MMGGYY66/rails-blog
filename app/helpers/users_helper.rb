module UsersHelper
  def add_post_link(user)
    return unless current_user.present?
    return unless current_user.id == user.id

    link_to 'Add Post', new_post_path, class: 'btn btn-primary'
    button_tag('Add Post') do
      link_to 'Add Post', new_post_path, class: 'btn btn-primary'
    end
    render partial: 'posts/new', locals: { current_user: @current_user }
    form_for @post, url: @post.to_s, method: :get do |f|
      f.submit 'Add Post', class: 'btn btn-primary'
    end
  end
end
