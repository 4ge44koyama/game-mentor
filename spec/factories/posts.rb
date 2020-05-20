FactoryBot.define do
  factory :post do
    title         { "こんにちは！" }
    content       { "テストです" }
    fee           { "500円" }
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end
