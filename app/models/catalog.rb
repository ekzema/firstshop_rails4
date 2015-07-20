class Catalog < ActiveRecord::Base
 
	has_many :boxes, :dependent => :destroy

	has_attached_file :image_catalog, :styles => { :medium => "200", :thumb => "100x100>" }, :default_url => "noimage.png"
  validates_attachment_content_type :image_catalog, :content_type => /\Aimage\/.*\Z/
end
