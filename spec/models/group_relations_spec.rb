require 'rails_helper'

RSpec.describe GroupRelation, type: :model do 

	it "accountとgroupが存在すれば正常終了する" do

		FactoryBot.create(:group)

		FactoryBot.create(:account)

		group_relation = GroupRelation.new(
			id: nil,
			group_id: 1000,
			account_id: 1000,
			created_at: nil,
			updated_at: nil,
		)
		expect(group_relation).to be_valid
	end

	it "groupが存在しなければエラーになる" do
		FactoryBot.create(:group)

		FactoryBot.create(:account)

		group_relation = GroupRelation.new(
					id: nil,
					group_id: 1001,
					account_id: 1000,
					created_at: nil,
					updated_at: nil,
		)
		#   group_relation.valid?
		#   expect(group_relation.errors[:group]).to include("must exist") 
		expect(group_relation).to_not be_valid #書き方わからないので仮記載
	end

	it "accountが存在しなければエラーになる" do
			FactoryBot.create(:group)

			FactoryBot.create(:account)

			group_relation = GroupRelation.new(
						id: nil,
						group_id: 1000,
						account_id: 1001,
						created_at: nil,
						updated_at: nil,
			)
		#   group_relation.valid?
		#   expect(group_relation.errors[:group]).to include("must exist") 
		expect(group_relation).to_not be_valid #書き方わからないので仮記載
	end
end