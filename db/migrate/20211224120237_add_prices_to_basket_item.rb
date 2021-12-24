class AddPricesToBasketItem < ActiveRecord::Migration[6.1]
  def change
    add_column :basket_items, :unit_price, :decimal, precision: 8, scale: 2
    add_column :basket_items, :total_price, :decimal, precision: 8, scale: 2
  end
end
