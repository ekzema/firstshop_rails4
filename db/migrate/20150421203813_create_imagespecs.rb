class CreateImagespecs < ActiveRecord::Migration
  def change
    create_table :imagespecs do |t|
      t.references :product, index: true

      t.timestamps null: false
    end
    add_foreign_key :imagespecs, :products
  end
end
