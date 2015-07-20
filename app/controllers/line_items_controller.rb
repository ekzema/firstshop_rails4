class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create, :update]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end
# format.js { render action: "create2"}
  # POST /line_items
  # POST /line_items.json
  def create    
    @product = Product.find(params[:product_id])
    @line_item = @cart.add_product(@product.id)
    respond_to do |format|
      @line_item.save
      if params[:product2] == "1"
       #{product.model} добавлен в корзину"} 
         format.js { render action: "create2"}
        else
          format.js 
    end
  end
  end
# format.js { render action: "create2"}
  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    if params[:line_item][:quantity] < "1" 
      render js: "alert('Колличество товара должно быть не меньше 1-ого!');"
    else
      respond_to do |format|
        @line_item.update(line_item_params)     
        format.js
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @product = @line_item.product
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      if params[:product2] == "1"
       format.js { render action: "destroy2"}
      else
        format.js 
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def line_item_params
    params.require(:line_item).permit(:product_id, :quantity)
  end
end
