class AddPricesToBasket < ActiveRecord::Migration[6.1]
  def change
    add_column :baskets, :subtotal, :decimal, precision: 8, scale: 2
    add_column :baskets, :total, :decimal, precision: 8, scale: 2
  end
end
