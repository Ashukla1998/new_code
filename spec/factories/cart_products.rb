# spec/factories/cart_products.rb

FactoryBot.define do
    factory :cart_product do
      association :cart
      association :product
      quantity { 1 }
  
      # Other attributes if needed
  
      # Add any necessary callbacks or traits here
  
      factory :cart_product_with_custom_quantity do
        quantity { 5 }
      end
    end
  end
  