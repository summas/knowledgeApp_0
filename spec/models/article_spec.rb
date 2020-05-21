require 'rails_helper'

RSpec.describe Article, type: :model do 

	it "accountとgroupが存在すること" do

		FactoryBot.create(:category)

		FactoryBot.create(:disclosureRange)

		FactoryBot.create(:group)

		FactoryBot.create(:account)

		article = Article.new(
				id: nil,
				title: 'tester@example.com',
				content:"password",
				category_id: 1000,
				group_id: 1000,
				account_id: 1000,
				disclosureRange_id: 1000,
				created_at: nil,
				updated_at: nil,
				)
		expect(article).to be_valid
	end  
end