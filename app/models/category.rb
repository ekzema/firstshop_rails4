class Category < ActiveRecord::Base

	belongs_to :product
	belongs_to :filtr

end
