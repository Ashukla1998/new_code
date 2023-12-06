# spec/factories/carts.rb

FactoryBot.define do
    factory :cart do
      association :user
      created_at { Time.current }
      updated_at { Time.current }
  
      # Other attributes or traits if needed
    end
  end
  