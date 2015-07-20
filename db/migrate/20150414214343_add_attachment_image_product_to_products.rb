class AddAttachmentImageProductToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :image_product
    end
  end

  def self.down
    remove_attachment :products, :image_product
  end
end
