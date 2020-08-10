FactoryBot.define do
  factory :stock_item do
    association :product 
    association :store
	quantity {Faker::Number.between(from: 1, to: 99)}     
  end
end
