FactoryBot.define do
  factory :account do
    id {1000}
    name {"テスト　太郎"}
    email {"test@example.com"}
    password {"qwerty"}
  end
end
