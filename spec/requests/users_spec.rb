require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/users/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/users/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /_user" do
    it "returns http success" do
      get "/users/_user"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /_bio" do
    it "returns http success" do
      get "/users/_bio"
      expect(response).to have_http_status(:success)
    end
  end

end
