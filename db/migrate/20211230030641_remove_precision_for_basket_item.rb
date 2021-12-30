class RemovePrecisionForBasketItem < ActiveRecord::Migration[6.1]
  def change
    change_column :basket_items, :unit_price, :decimal, precision: nil, scale: nil
  end
end
