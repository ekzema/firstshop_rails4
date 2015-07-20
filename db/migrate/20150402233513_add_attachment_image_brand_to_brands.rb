class AddAttachmentImageBrandToBrands < ActiveRecord::Migration
  def self.up
    change_table :brands do |t|
      t.attachment :image_brand
    end
  end

  def self.down
    remove_attachment :brands, :image_brand
  end
end
