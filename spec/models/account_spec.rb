require 'rails_helper'

RSpec.describe Account, type: :model do 
    
     #姓、名、メール、パスワードがあれば有効な状態であること
     it "is valid with a email,and encrypted_password" do
          account = Account.new(
          id: nil,
          email:"tester@example.com",
          password:"password",
          created_at: nil,
          updated_at: nil,
          name: nil,
          auth: nil,
          organization: nil
          )
          expect(account).to be_valid
     end

     #名がなければ無効な状態であること
     #it"isinvalidwithoutafirstname"

     #権限がなければ無効な状態であること
     
     #メールアドレスがなければ無効な状態であること
     it "is invalid without an emailaddress" do
          account = Account.new(
               id: nil,
               email: nil,
               password:"password",
               created_at: nil,
               updated_at: nil,
               name: nil,
               auth: nil,
               organization: nil
               )
               account.valid?
               expect(account.errors[:email]).to include("を入力してください")
     end
     
     #重複したメールアドレスなら無効な状態であること
     it "is invalid with a duplicate emailaddress" do
          account = Account.create(
               id: nil,
               email: 'test@example1.com',
               password:"password",
               created_at: nil,
               updated_at: nil,
               name: nil,
               auth: nil,
               organization: nil
               )

          account = Account.new(
               id: nil,
               email: 'test@example1.com',
               password:"password",
               created_at: nil,
               updated_at: nil,
               name: nil,
               auth: nil,
               organization: nil
               )
               account.valid?
               expect(account.errors[:email]).to include("はすでに存在します")
     end
end