class AddMetaTagsColumnsToProducts < ActiveRecord::Migration
  def change  	  	
  	add_column :products, :meta_description, :string
  	add_column :products, :meta_keywords, :string
  end
end


