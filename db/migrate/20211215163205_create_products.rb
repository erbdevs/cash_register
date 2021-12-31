class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.text  :code
      t.text  :name
      t.decimal :price, scale: 2, precision: 8

      t.timestamps
    end
  end
end
