require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/posts/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/posts/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/posts/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/posts/edit'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /_post' do
    it 'returns http success' do
      get '/posts/_post'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /_full' do
    it 'returns http success' do
      get '/posts/_full'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /_comment' do
    it 'returns http success' do
      get '/posts/_comment'
      expect(response).to have_http_status(:success)
    end
  end
end
