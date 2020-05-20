FactoryBot.define do
  factory :message do
    content { "こんにちは！よろしくお願いします！" }
    to_id { 1 }
    user
  end
end
