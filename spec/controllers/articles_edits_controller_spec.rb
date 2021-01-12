require 'rails_helper'

RSpec.describe ArticleEditsController, type: :controller do
  describe 'GET /index' do
    it 'returns http status 302' do
      get :index
      expect(response).to have_http_status '302'
    end

    it 'returns http success as an authorized user' do
      @user = FactoryBot.create(:account)
      sign_in @user
      get :index
      expect(response).to have_http_status '200'
    end
  end
end
