require 'rails_helper'

RSpec.describe TestsessionsController, type: :controller do
  describe 'GET /create' do
    # FactoryBot.create(:account)
    it 'returns http success' do
      post :create
      expect(response).to redirect_to '/'
    end
  end
end
