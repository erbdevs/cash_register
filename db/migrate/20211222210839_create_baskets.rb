class CreateBaskets < ActiveRecord::Migration[6.1]
  def change
    create_table :baskets do |t|
      t.string :client
      t.string :state

      t.timestamps
    end
  end
end
