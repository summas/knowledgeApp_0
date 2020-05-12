require 'rails_helper'

RSpec.describe Group, type: :model do 
    
     #エラーになるようにする
     it "各設定値がnilでもエラーにはならない" do
          group = Group.new(
               id: nil,
               name: nil,
               created_at: nil,
               updated_at: nil,
          )
          expect(group).to be_valid
     end
end