class Box < ActiveRecord::Base
	
	has_many :brands, :dependent => :destroy
	has_many :filtrs, :dependent => :destroy
	belongs_to :catalog
	 accepts_nested_attributes_for :filtrs, 
  :allow_destroy => true,
  :reject_if => :all_blank
  
  has_attached_file :image, :styles => { :medium => "X60", :thumb => "100x100>"}, :default_url => "NoImage_X60.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
