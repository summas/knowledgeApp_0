FactoryBot.define do
  factory :account do
    id {1000}
    name {"テスト　太郎"}
    email {"test@example1.com"}
    password {"qwerty"}
    auth {3}
  end
end
