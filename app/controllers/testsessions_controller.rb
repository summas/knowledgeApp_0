class TestsessionsController < ApplicationController
  def create
    account = Account.find_by(email: 'test@example.com')
    puts 'テストセッション'
    puts account.id
    session[:account_id] = account.id
    flash[:success] = 'テストユーザとしてログインしました。'
    sign_in account
    redirect_to '/'
  end
end
