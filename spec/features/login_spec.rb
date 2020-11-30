require 'rails_helper'

RSpec.feature "Logins", type: :feature do

	 # scenario "正常にログインする" do 
	 # 	account=FactoryBot.create(:account)
	 # 	FactoryBot.create(:siteConfig)
	 # 	visit root_path
	 # 	find(".dropdown-toggle").click
	 # 	click_link "ログイン"
	 # 	fill_in "account[email]", with:account.email  #"qwerty@example.com"
	 # 	fill_in "account[password]", with:account.password #"qwerty"
	 # 	click_button "Log in" 
	 # 	expect(page).to have_content account.name
	 # end
	
	 # scenario "ログイン失敗、メールアドレス誤り" do 
	 # 	account=FactoryBot.create(:account)
	 # 	FactoryBot.create(:siteConfig)
	 # 	visit root_path
	 # 	click_link "ログイン"
	 # 	fill_in "account[email]", with:account.email + "1"
	 # 	fill_in "account[password]", with:account.password 
	 # 	click_button "Log in" 
	 # 	expect(page).not_to have_content account.name
	 # end

	 # scenario "ログイン失敗、パスワード誤り" do 
	 # 	account=FactoryBot.create(:account)
	 # 	FactoryBot.create(:siteConfig)
	 # 	visit root_path
	 # 	click_link "ログイン"
	 # 	fill_in "account[email]", with:account.email
	 # 	fill_in "account[password]", with:account.password + "1"
	 # 	click_button "Log in" 
	 # 	expect(page).not_to have_content account.name
	 # end

end
