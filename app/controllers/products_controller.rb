class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  layout "product_show_layout", only: "show"
  # rescue_from ActiveRecord::RecordNotFound, with: :invalid_product

   def index
     @products = Product.paginate(:page => params[:page], :per_page => 20)
   end

   def show
     @d2 = "1"    
     @product = Product.find(params[:id])
     box = @product.brand.box
     array_product = box.brands.map {|i| i.products.ids.delete_if{|i| i == @product.id}}.flatten.shuffle.take(4)      
     @product_random = Product.where(id: array_product)
   end

  def new
    @brand = Brand.find(params[:brand_id])
    @product = Product.new
    @specification = @product.specifications.build
    @imagespec = @product.imagespecs.build
    @filtr = @brand.box.filtrs         
  end

  def create
    @brand = Brand.find(params[:brand_id])
    @product = @brand.products.build(product_params)
    if @product.save
      redirect_to(@product.brand) 
    else
      render "new"
    end
  end

  def edit    
    @product = Product.find(params[:id])
    @imagespec = @product.imagespecs.build   
    @brand = @product.brand
    @filtr = @brand.box.filtrs    
  end

  def update
    @product = Product.find(params[:id])
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product.brand, notice: "Товар #{@product.model} был успешно изменён" }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to :back
  end

 def delete_attachment
    @product = Product.find(params[:id])
    @product.image_product = nil
    @product.save
    redirect_to :back
  end

  def who_bought
    @product = Product.find(params[:id])
    @latest_order = @product.orders.order(:updated_at).last
    if stale?(@latest_order)
      respond_to do |format|
        format.atom
      end
    end
  end
  
  private

  # def invalid_product
  #     redirect_to :root, :notice => 'Эта страница не существет или была удалена!'  
  # end

  def product_params
    params.require(:product).permit(:image_product, :addinformation, :description, :madein, :model, :price, :warranty, :title, :spec_column1, :spec_column2, :meta_description, :meta_keywords, :recommend, { filtr_ids:[] },       
      specifications_attributes: [:id, :_destroy, :title, :column_1, :column_2],
      imagespecs_attributes: [:id, :_destroy, :image],
      categories_attributes: [:id, :prodict_id, :filtr_id]
      )
  end

end
