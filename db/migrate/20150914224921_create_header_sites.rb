class CreateHeaderSites < ActiveRecord::Migration
  def change
    create_table :header_sites do |t|
      t.string :description
      t.string :keywords
      t.string :title
      t.string :author

      t.timestamps null: false
    end
  end
end
