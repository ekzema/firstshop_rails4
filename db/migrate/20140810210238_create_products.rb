class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :description
      t.text :addinformation
      t.integer :price
      t.string :model
      t.string :warranty
      t.string :madein
      t.references :brand

      t.timestamps
    end
    add_index :products, :brand_id
  end
end
