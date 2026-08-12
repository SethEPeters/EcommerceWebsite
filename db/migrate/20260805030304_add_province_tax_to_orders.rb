class AddProvinceTaxToOrders < ActiveRecord::Migration[8.1]
  def change
    add_reference :orders, :province_tax, null: false, foreign_key: true
  end
end
