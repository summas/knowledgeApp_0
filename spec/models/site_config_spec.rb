require 'rails_helper'

RSpec.describe SiteConfig, type: :model do 
    
     #エラーになるようにするべきか
     it "各設定値がnilでもエラーにはならない" do
          site_config = SiteConfig.new(
               id: nil,
               title: nil,
               subtitle: nil,
               created_at: nil,
               updated_at: nil,
               style: nil,
          )
          expect(site_config).to be_valid
     end
end