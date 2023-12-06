
FactoryBot.define do
    factory :product do
      name { Faker::Commerce.product_name }
      description { Faker::Lorem.paragraph }
      price { Faker::Commerce.price(range: 0..100.0, as_string: true) }
      association :user
  
      trait :with_custom_price do
        price { '50.00' }
      end
    end
  end
  