class RemoveFieldsForAbstractPricingRule < ActiveRecord::Migration[6.1]
  def change
    remove_column :pricing_rules, :unitary_factor_price, :decimal, precision: 2, scale: 2
    remove_column :pricing_rules, :unitary_absolute_price, :decimal, precision: 10, scale: 2
  end
end
