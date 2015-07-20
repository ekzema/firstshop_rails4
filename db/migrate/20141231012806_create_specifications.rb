class CreateSpecifications < ActiveRecord::Migration
  def change
    create_table :specifications do |t|
      t.string :title
      t.string :column_1
      t.string :column_2
      t.references :product, index: true

      t.timestamps null: false
    end
    add_foreign_key :specifications, :products
  end
end
