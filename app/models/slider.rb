class Slider < ActiveRecord::Base
validates :name, :image, presence: true

	has_attached_file :image, :styles => { :medium => "1000x250#", :thumb => "192x48#" }, :default_url => "noimage.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
