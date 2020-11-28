require 'rails_helper'

RSpec.describe 'Reacts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/reacts/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /group' do
    it 'returns http success' do
      get '/reacts/group'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /group/1' do
    it 'returns http success' do
      get '/reacts/group/1'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /ajax' do
    it 'returns http success' do
      get '/reacts/ajax'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /ajax/:id' do
    it 'returns http success' do
      get '/reacts/ajax/2'
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /ajax/:id/:group_id'" do
    it 'returns http success' do
      get '/reacts/ajax/2/3'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /category' do
    it 'returns http success' do
      get '/reacts/category'
      expect(response).to have_http_status(:success)
    end
  end
end
