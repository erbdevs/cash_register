class CreateFactorDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table :factor_discounts do |t|
      t.references :product, null: false, foreign_key: true
      t.text :name
      t.integer :min_products_number
      t.integer :max_products_number
      t.boolean :enabled, default: false
      t.decimal :value, precision: 2, scale: 2

      t.timestamps
    end
  end
end
