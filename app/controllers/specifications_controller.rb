class SpecificationsController < ApplicationController
before_action :authenticate_admin!
  def create
      @product = Product.find(params[:product_id])
      @specification = @product.specifications.create(specification_params)
  end

private
  def specification_params
      params.require(:specification).permit(:column_1, :column_2)
  end

  end