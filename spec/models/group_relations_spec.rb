require 'rails_helper'

RSpec.describe GroupRelation, type: :model do 
    
     
     it "accountとgroupが存在すれば正常終了する" do
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

          group_relation = GroupRelation.new(
               id: nil,
               group_id: 1,
               account_id: 1,
               created_at: nil,
               updated_at: nil,
          )
          expect(group_relation).to be_valid
     end

     it "groupが存在しなければエラーになる" do
          group = Group.create(
               id: 2,
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

          group_relation = GroupRelation.new(
               id: nil,
               group_id: 1,
               account_id: 1,
               created_at: nil,
               updated_at: nil,
          )
       #   group_relation.valid?
       #   expect(group_relation.errors[:group]).to include("must exist") 
        expect(group_relation).to_not be_valid #書き方わからないので仮記載
     end

     it "accountが存在しなければエラーになる" do
          group = Group.create(
               id: 1,
               name: "group1",
               created_at: nil,

               updated_at: nil,
          )

          Account.create(
               id: 2,
               email:"tester@example.com",
               password:"password",
               created_at: nil,
               updated_at: nil,
               name: nil,
               auth: nil,
               organization: nil
               )

          group_relation = GroupRelation.new(
               id: nil,
               group_id: 1,
               account_id: 1,
               created_at: nil,
               updated_at: nil,
          )
       #   group_relation.valid?
       #   expect(group_relation.errors[:group]).to include("must exist") 
        expect(group_relation).to_not be_valid #書き方わからないので仮記載
     end
end