class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.string :name
      t.string :url_item

      t.timestamps null: false
    end
  end
end
