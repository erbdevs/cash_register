class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string  :code
      t.string  :name
      t.decimal :price, scale: 2, precision: 8

      t.timestamps
    end
  end
end
