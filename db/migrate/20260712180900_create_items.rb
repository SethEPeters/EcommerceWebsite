class CreateItems < ActiveRecord::Migration[8.1]
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.image :image
      t.string :artist
      t.float :price
      t.integer :quantity

      t.timestamps
    end
  end
end
