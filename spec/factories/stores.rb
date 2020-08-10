FactoryBot.define do
  factory :store do
    name { Faker::Lorem.word }
    address { Faker::Address.full_address }
  end
end
