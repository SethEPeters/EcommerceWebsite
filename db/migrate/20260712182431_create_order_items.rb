class CreateOrderItems < ActiveRecord::Migration[8.1]
  def change
    create_table :order_items do |t|
      t.string :title
      t.string :item_image_path
      t.float :price_at_purchase
      t.datetime :date_price_good_until

      t.timestamps
    end
  end
end
