FactoryBot.define do
  factory :request do
    status       { 1 }
    to_id        { 2 }
    user
  end
end
