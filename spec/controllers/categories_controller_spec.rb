require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  before do
    @account = FactoryBot.create(:account)
    FactoryBot.create(:category)
    FactoryBot.create(:disclosureRange)
    FactoryBot.create(:group)
  end

  describe 'GET /index' do
    it 'returns http status 302' do
      get :index
      expect(response).to have_http_status '302'
    end

    it 'returns http success as an authorized user' do
      sign_in @account
      get :index
      expect(response).to have_http_status '200'
    end
  end
end
