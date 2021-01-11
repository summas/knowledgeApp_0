require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'GET /index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status '200'
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      FactoryBot.create(:category)

      FactoryBot.create(:disclosureRange)

      FactoryBot.create(:group)
      FactoryBot.create(:article)
      get :show, params: { id: 1000 }
      expect(response).to have_http_status '200'
    end
  end
end
