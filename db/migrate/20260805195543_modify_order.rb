class ModifyOrder < ActiveRecord::Migration[8.1]
  def change
    remove_column :orders, :name, :string
    add_column :orders, :first_name, :string
    add_column :orders, :last_name, :string
  end
end
