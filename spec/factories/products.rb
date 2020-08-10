FactoryBot.define do
  factory :product do
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    price { Faker::Number.decimal(l_digits: 2).to_d }
  end
end
