class CreateCustomers < ActiveRecord::Migration[8.1]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :street_address
      t.string :province

      t.timestamps
    end
  end
end
