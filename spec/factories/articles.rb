FactoryBot.define do
  factory :article do
    id {1000}
    title {"テストtitle"}
    content {"テストcontent"}
    category_id {1000}
    group_id {1000}
    account_id {1}
    disclosureRange_id {1000}
  end
end
