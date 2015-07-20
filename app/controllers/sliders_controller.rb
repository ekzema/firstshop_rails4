class SlidersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_slider, only: [:show, :edit, :update, :destroy]
  layout "sliders_layout"
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_slider
  respond_to :html

  def index
    @slider = Slider.new
    @sliders = Slider.all
    respond_with(@sliders)
  end

  def show
    respond_with(@slider)
  end

  def new
    @slider = Slider.new
    respond_with(@slider)
  end

  def edit
  end

  def create
    @slider = Slider.new(slider_params)
     if @slider.save
      redirect_to :back
    else
      redirect_to :back, alert: 'Не все поля были заполнены!'
    end
    
  end

  def update
    respond_to do |format|
      if @slider.update(slider_params)
        format.html { redirect_to action: 'index' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @slider.destroy
    respond_with(@slider)
  end

  private

    def invalid_slider
        redirect_to :root, :notice => 'Эта страница не существет или была удалена!'  
    end

    def set_slider
      @slider = Slider.find(params[:id])
    end

    def slider_params
      params.require(:slider).permit(:name, :url_item, :image)
    end
end
