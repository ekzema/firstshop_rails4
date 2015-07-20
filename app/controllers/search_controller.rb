class SearchController < ApplicationController
include CurrentCart
before_action :set_cart

  def result
  		if params[:q].blank?
  			redirect_to :back, notice: 'Введите текст для поиска!'
  		else
  		@product = Product.where("model LIKE ? OR madein LIKE ? OR description LIKE ? OR addinformation LIKE ? ", 
  		"%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
  	end
  end

  # def result_filtr   
  # 	product = Category.where('filtr_id IN (?)', params[:product])
  #   @product_array = Array.new
  #   product.each do |p|
  #     p_id = p.product_id
  #     @product_array << p_id
  #   end
  #   @result = Product.where(id: @product_array)    
  # end

end
