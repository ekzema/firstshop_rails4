class BrandsController < ApplicationController
  before_action :authenticate_admin!, except: [:show, :index]
  include CurrentCart
  before_action :set_cart
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_brand

def index
  @products = Product.order(:model)
end

def show  
  @brand = Brand.find(params[:id])
  @title = @brand.box.name + " " + @brand.name
  @box = @brand.box
  @filtr = @box.filtrs
  if params[:product].blank?
    @products = Product.where(brand_id: @brand.id).paginate(:page => params[:page], :per_page => 15)  
  else   
    product = Category.where('filtr_id IN (?)', params[:product])    
    product_array = product.map(&:product_id)
    @products = @brand.products.where(id: product_array).paginate(:page => params[:page], :per_page => 15)   
  end
end




def new
@box = Box.find(params[:box_id])
@brand = @box.brands.new

end


def create
    @box = Box.find(params[:box_id])
    @brand = @box.brands.create(brand_params)
    redirect_to(@brand.box)
end


  def edit
    @brand = Brand.find(params[:id])
  end

def update
    @brand = Brand.find(params[:id])

    respond_to do |format|
      if @brand.update_attributes(brand_params)
        format.html { redirect_to @brand, notice: 'Catalog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end


   def destroy
      @brand = Brand.find(params[:id])
       @brand.destroy
    redirect_to(@brand.box)
  end

  def delete_attachment
    @brand= Brand.find(params[:id])
    @brand.image_brand = nil
    @brand.save
    redirect_to :back 
  end

private

  def invalid_brand
      redirect_to :root, :notice => 'Эта страница не существет или была удалена!'  
     end
 
  def brand_params
      params.require(:brand).permit(:name, :image_brand)
  end

end
