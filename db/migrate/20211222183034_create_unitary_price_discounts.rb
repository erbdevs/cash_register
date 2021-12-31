class CreateUnitaryPriceDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table :unitary_price_discounts do |t|
      t.references :product, null: false, foreign_key: true
      t.text :name
      t.integer :min_products_number
      t.integer :max_products_number
      t.boolean :enabled
      t.decimal :value, precision: 10, scale: 2

      t.timestamps
    end
  end
end
