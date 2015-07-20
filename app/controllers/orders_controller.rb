class OrdersController < ApplicationController
  before_action :authenticate_admin!, except: [:new, :create]
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_order
  respond_to :html

  def index
    @orders = Order.all
    respond_with(@orders)
  end

  def show
   @line_item = LineItem.where(order_id: @order)
  end

  def new
      if @cart.line_items.empty?
      redirect_to :root, notice: "Для оформления заказа добовьте товар в корзину!"
      return
    end

    @order = Order.new
   end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        OrderNotifier.received(@order).deliver
        format.html { redirect_to :root, notice: 
          'Спасибо за Ваш заказ!' }
        format.json { render action: 'show', status: :created,
          location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors,
          status: :unprocessable_entity }
      end
    end
  end

  def update
    @order.update(order_params)
    respond_with(@order)
  end

  def destroy
    @order.destroy
    respond_with(@order)
  end

  private

    def invalid_order
      redirect_to :root, :notice => 'Эта страница не существет или была удалена!'  
    end

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:name, :address, :email, :pay_type)
    end
end
