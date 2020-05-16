FactoryBot.define do

  factory :user do
    name              {"テスト"}
    email                 {"test-user@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
  end

end