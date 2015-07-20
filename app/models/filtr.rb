class Filtr < ActiveRecord::Base
  belongs_to :box
  has_many :categories, :dependent => :destroy
  has_many :product, through: :categories
end
