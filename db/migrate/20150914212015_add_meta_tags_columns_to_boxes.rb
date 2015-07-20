class AddMetaTagsColumnsToBoxes < ActiveRecord::Migration
  def change
  	add_column :boxes, :meta_tags, :string
  end
end
