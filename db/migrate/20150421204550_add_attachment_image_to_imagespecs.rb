class AddAttachmentImageToImagespecs < ActiveRecord::Migration
  def self.up
    change_table :imagespecs do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :imagespecs, :image
  end
end
