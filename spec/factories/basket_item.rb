FactoryBot.define do
  factory :basket_item do
    basket { create(:basket) }
    product { create(:product) }
    quantity { 1 }
  end
end
