require 'rails_helper'

RSpec.describe Category, type: :model do 
    
     #エラーになるようにする
     it "各設定値がnilでもエラーにはならない" do
          category = Category.new(
               id: nil,
               name: nil,
               created_at: nil,
               updated_at: nil,
          )
          expect(category).to be_valid
     end
end