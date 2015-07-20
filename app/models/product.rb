class Product < ActiveRecord::Base
  has_many :orders, through: :line_items
  has_many :line_items	
  before_destroy :ensure_not_referenced_by_any_line_item
  validates :model, :price, presence: true

  belongs_to :brand
  has_many :categories, :dependent => :destroy
  has_many :filtrs, through: :categories
  has_many :specifications, :dependent => :destroy
  has_many :imagespecs, :dependent => :destroy
  has_many :comments, as: :commentable, :dependent => :destroy
  
  accepts_nested_attributes_for :specifications, 
  :allow_destroy => true,
  :reject_if => :all_blank
  
  accepts_nested_attributes_for :imagespecs, 
  :allow_destroy => true,
  :reject_if => :all_blank

  has_attached_file :image_product, :styles => { :medium => "200x300>", :thumb => "180", :cart_icon => "X50" }, :default_url => "NoImage_180X170.jpg"
  validates_attachment_content_type :image_product, :content_type => /\Aimage\/.*\Z/

  private

    # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end

  end
