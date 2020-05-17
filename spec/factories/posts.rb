FactoryBot.define do

  factory :post do
    title         {"初投稿です！"}
    content       {"こんにちは！よろしくお願いします！"}
    fee           {"500円"}
    user
  end

end