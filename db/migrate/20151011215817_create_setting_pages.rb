class CreateSettingPages < ActiveRecord::Migration
  def change
    create_table :setting_pages do |t|
      t.string :course, default: 1 
      t.integer :comments, default: 1 
      t.integer :sliders, default: 1 

      t.timestamps null: false
    end
    SettingPage.create
  end
end
