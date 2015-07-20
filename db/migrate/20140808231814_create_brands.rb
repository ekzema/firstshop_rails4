class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.references :box

      t.timestamps
    end
    add_index :brands, :box_id
  end
end
