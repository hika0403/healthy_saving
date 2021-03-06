require 'rails_helper'

RSpec.describe 'Goals', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/goals/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/goals/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/goals/show'
      expect(response).to have_http_status(:success)
    end
  end
end
