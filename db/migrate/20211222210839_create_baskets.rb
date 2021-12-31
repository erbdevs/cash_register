class CreateBaskets < ActiveRecord::Migration[6.1]
  def change
    create_table :baskets do |t|
      t.text :client
      t.text :state

      t.timestamps
    end
  end
end
