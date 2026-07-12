class CreateItems < ActiveRecord::Migration[8.1]
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.string :item_image_path
      t.string :artist
      t.float :price
      t.integer :quantity

      t.timestamps
    end
  end
end
