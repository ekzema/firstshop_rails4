class BoxesController < ApplicationController
  before_action :authenticate_admin!, except: [:show, :index]
  include CurrentCart
  before_action :set_cart
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_box

  def index
  @products = Product.order(:model)
  end

  def show
    @box = Box.find(params[:id])
    @title = @box.name + " по самым низким ценам!!"
    @keywords = @box.meta_tags
    @brand = @box.brands
    @filtr = @box.filtrs    
    if params[:product].blank?
      @products = Product.where(brand_id: @brand.ids).paginate(:page => params[:page], :per_page => 15)  
    else   
      product = Category.where('filtr_id IN (?)', params[:product])
      product_array = product.map(&:product_id)
      @products = Product.where(id: product_array).paginate(:page => params[:page], :per_page => 12)         
    end 
  end 

  def new
    @catalog = Catalog.find(params[:catalog_id]) 
    @box = @catalog.boxes.new
  end


  def create
      @catalog = Catalog.find(params[:catalog_id])
      @box = @catalog.boxes.create(box_params)
      redirect_to(@box.catalog)
  end


  def edit
    @box = Box.find(params[:id])
  end

def update
    @box = Box.find(params[:id])

    respond_to do |format|
      if @box.update_attributes(box_params)
        format.html { redirect_to @box, notice: 'Catalog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @box.errors, status: :unprocessable_entity }
      end
    end
  end


   def destroy
       @box = Box.find(params[:id])
       @box.destroy
    redirect_to :back
  end
 
  def delete_attachment
    @box= Box.find(params[:id])
    @box.image = nil
    @box.save
    redirect_to :back 
  end

   private

     def invalid_box
      redirect_to :root, :notice => 'Эта страница не существет или была удалена!'  
     end

    def box_params
      params.require(:box).permit(:name, :image, :meta_tags, filtrs_attributes: [:id, :_destroy, :body])
    end

end


   