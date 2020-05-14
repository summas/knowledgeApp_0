require 'rails_helper'

RSpec.feature "Logins", type: :feature do
  #ログインする
  scenario "user creates a new project" do 
  account=FactoryBot.create(:account)
  visit root_path
  click_link "ログイン"
  fill_in "qwerty@gmail.com", with:account.email 
  fill_in "qwerty", with:account.password
  click_button "Log in" 
  expect{
     click_link "NewProject"
     fill_in "Name", with:"TestProject"
     fill_in "Description",with:"TryingoutCapybara"
     click_button"CreateProject"
     expect(page).to have_content "Project was successfully created"
     expect(page).to have_content "Test
     }"
    }.to change(user.projects,:count).by(1)
 end
  

#pending "add some scenarios (or delete) #{__FILE__}"

end
