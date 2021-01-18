require 'rails_helper'

RSpec.describe ArticleEditsController, type: :controller do
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

  describe 'GET /new' do
    it 'returns http success as an authorized user' do
      sign_in @account
      get :new
      expect(response).to have_http_status '200'
    end

    it 'post' do
      sign_in @account
      get :new
      expect(response).to have_http_status '200'
    end
  end

  describe 'post /create' do
    it 'post' do
      articles_params = FactoryBot.attributes_for(:article)
      sign_in @account
      # post :create, params: { title: @article.title, content: @article.content,  category_id: @article.id
      # ,group_id: @article.group_id ,account_id:@article.account_id ,disclosureRange_id:@article.disclosureRange_id, image: @article.image}
      post :create, params: { article: articles_params }
      expect(response).to redirect_to root_path
    end
  end

  describe 'post /edit' do
    it 'patch' do
      @article = FactoryBot.create(:article)
      articles_params = FactoryBot.attributes_for(:article)
      sign_in @account
      patch :edit, params: { article: articles_params, id: @article.id }
      expect(response).to redirect_to root_path
    end
  end

  describe 'patch /edit' do
    it 'patch' do
      @article = FactoryBot.create(:article)
      articles_params = FactoryBot.attributes_for(:article)
      sign_in @account
      patch :edit, params: { article: articles_params, id: @article.id }
      expect(response).to redirect_to root_path
    end
  end

  describe 'post / destroy' do
    it 'patch' do
      @article = FactoryBot.create(:article)
      articles_params = FactoryBot.attributes_for(:article)
      sign_in @account
      patch :edit, params: { article: articles_params, id: @article.id }
      expect(response).to redirect_to root_path
    end
  end
end
