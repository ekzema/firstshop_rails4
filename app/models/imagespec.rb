class Imagespec < ActiveRecord::Base
  belongs_to :product

  	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "X40" }, :default_url => "NoImage_50X50.jpg"
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
