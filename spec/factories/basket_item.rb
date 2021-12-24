FactoryBot.define do
  factory :basket_item do
    basket { create(:basket) }
    product { create(:product) }
    quantity { 1 }
    unit_price { 0 }
    total_price { 0 }
  end
end
