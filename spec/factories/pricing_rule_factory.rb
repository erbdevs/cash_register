FactoryBot.define do
  factory :pricing_rule do
    product { create(:product, name: 'Green Tea') }
    name { 'CEO rule for tea' }
    min_products_number { 3 }
    max_products_number { nil }
    enabled { true }
    unitary_absolute_price { 1.3 }
    unitary_factor_price { nil }

    trait :with_factor do
      unitary_absolute_price { nil }
      unitary_factor_price { 0.5 }
    end
  end
end
