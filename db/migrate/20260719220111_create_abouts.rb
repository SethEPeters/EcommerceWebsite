class CreateAbouts < ActiveRecord::Migration[8.1]
  def change
    create_table :abouts do |t|
      t.text :about_info

      t.timestamps
    end
  end
end
