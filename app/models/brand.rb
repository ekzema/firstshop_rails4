class Brand < ActiveRecord::Base
	belongs_to :box
	has_many :products, :dependent => :destroy
	# has_attached_file :image_brand, :default_url => "noimage.png"
	has_attached_file :image_brand, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "noimage.png"
  validates_attachment_content_type :image_brand, :content_type => /\Aimage\/.*\Z/



end
