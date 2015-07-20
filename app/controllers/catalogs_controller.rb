class CatalogsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show, :recommend]
  include CurrentCart
  before_action :set_cart
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_catalog

  # GET /catalogs
  # GET /catalogs.json
  def index     
    @product = Product.select(:id, :model, :price, :image_product_file_name).order(:created_at).reverse_order.limit(10)
    @recommend_find = Product.where(recommend: '1')   
    @recommend =  @recommend_find.shuffle.take(5)
  end

  # GET /catalogs/1
  # GET /catalogs/1.json
  def show
    @catalog = Catalog.find(params[:id])
    @box = @catalog.boxes.all
  
  end

  # GET /catalogs/new
  # GET /catalogs/new.json
  def new
    @catalog = Catalog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @catalog }
    end
  end

  # GET /catalogs/1/edit
  def edit
    @catalog = Catalog.find(params[:id])
  end

  # POST /catalogs
  # POST /catalogs.json
  def create
    @catalog = Catalog.create(catalog_params)
    redirect_to :root
  end

  # PUT /catalogs/1
  # PUT /catalogs/1.json
  def update
    @catalog = Catalog.find(params[:id])

    respond_to do |format|
      if @catalog.update_attributes(catalog_params)
        format.html { redirect_to @catalog, notice: 'Ваш каталог был успешно обновлён!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @catalog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catalogs/1
  # DELETE /catalogs/1.json
  def destroy
    @catalog = Catalog.find(params[:id])
    @catalog.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  def delete_attachment
    @catalog= Catalog.find(params[:id])
    @catalog.image_catalog = nil
    @catalog.save
    redirect_to :back
  end

  def recommend      
    @products = Product.where(recommend: '1').select(:id, :model, :price, :image_product_file_name).paginate(:page => params[:page], :per_page => 15)  
  end

private
  def catalog_params
      params.require(:catalog).permit(:name, :image_catalog)
  end
  
    def invalid_catalog
    logger.error "Attempt to access invalid catalog #{params[:id]}"
    redirect_to :root, notice: 'Эта страница не существет или была удалена!'
  end

end
