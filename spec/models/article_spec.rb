require 'rails_helper'

RSpec.describe Article, type: :model do 
    
     it "accountとgroupが存在すること" do

          Category.create(
               id: 1,
               name: nil,
               created_at: nil,
               updated_at: nil,
          )

          DisclosureRange.create(
               id: 1,
               name: nil,
               created_at: nil,
               updated_at: nil,
          )

          Group.create(
               id: 1,
               name: "group1",
               created_at: nil,

               updated_at: nil,
          )

          Account.create(
               id: 1,
               email:"tester@example.com",
               password:"password",
               created_at: nil,
               updated_at: nil,
               name: nil,
               auth: nil,
               organization: nil
               )

          article = Article.new(
               id: nil,
               title: 'tester@example.com',
               content:"password",
               category_id: 1,
               group_id: 1,
               account_id: 1,
               disclosureRange_id: 1,
               created_at: nil,
               updated_at: nil,
               )
          expect(article).to be_valid
     end  
end