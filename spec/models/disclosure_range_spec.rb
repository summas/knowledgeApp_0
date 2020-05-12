require 'rails_helper'

RSpec.describe DisclosureRange, type: :model do 
    
     #エラーになるようにする
     it "各設定値がnilでもエラーにはならない" do
          disclosure_range = DisclosureRange.new(
               id: nil,
               name: nil,
               created_at: nil,
               updated_at: nil,
          )
          expect(disclosure_range).to be_valid
     end
end