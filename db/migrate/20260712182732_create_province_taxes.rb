class CreateProvinceTaxes < ActiveRecord::Migration[8.1]
  def change
    create_table :province_taxes do |t|
      t.string :province
      t.float :gst
      t.float :pst
      t.float :hst

      t.timestamps
    end
  end
end
