class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :product_id
      t.integer :filtr_id

      t.timestamps null: false
    end
  end
end
