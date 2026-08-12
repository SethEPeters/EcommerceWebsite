class RemoveAddressFromOrders < ActiveRecord::Migration[8.1]
  def change
    remove_column :orders, :address, :string
  end
end
