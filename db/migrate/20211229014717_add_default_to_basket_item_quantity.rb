class AddDefaultToBasketItemQuantity < ActiveRecord::Migration[6.1]
  def change
    change_column_default :basket_items, :quantity, 0
  end
end
