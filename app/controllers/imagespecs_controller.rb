class ImagespecsController < ApplicationController
before_action :authenticate_admin!
  def create
      @product = Product.find(params[:product_id])
      @imagespec = @product.imagespecs.create(imagespec_params)
  end

private
  def imagespec_params
      params.require(:imagespec).permit(:image)
  end

end
