require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  let(:user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  describe 'GET /users' do
    it 'renders the index template and includes placeholder text' do
      get users_path
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
      expect(response.body).to include('<h5 class="card-title">Username</h5>')
    end
  end

  describe 'GET /users/:id' do
    it 'renders the show template and includes placeholder text' do
      get user_path(user.id)
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
      expect(response.body).to include('<h5 class="card-title">Bio</h5>')
    end
  end
end
