class AddAttachmentImageCatalogToCatalogs < ActiveRecord::Migration
  def self.up
    change_table :catalogs do |t|
      t.attachment :image_catalog
    end
  end

  def self.down
    remove_attachment :catalogs, :image_catalog
  end
end
