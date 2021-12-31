class CreatePricingRules < ActiveRecord::Migration[6.1]
  def change
    create_table :pricing_rules do |t|
      t.references :product, null: false, foreign_key: true
      t.text :name
      t.integer :min_products_number
      t.integer :max_products_number
      t.boolean :enabled, default: false
      t.decimal :unitary_absolute_price, precision: 10, scale: 2
      t.decimal :unitary_factor_price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
