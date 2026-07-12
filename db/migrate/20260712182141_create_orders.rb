class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.float :order_total_at_purchase
      t.string :delivery_address
      t.datetime :date_of_purchase

      t.timestamps
    end
  end
end
