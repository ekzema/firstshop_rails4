class CreateFiltrs < ActiveRecord::Migration
  def change
    create_table :filtrs do |t|
      t.string :body
      t.references :box, index: true

      t.timestamps null: false
    end
    add_foreign_key :filtrs, :boxes
  end
end
