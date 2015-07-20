class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :nav_menu, :slider
  before_action :current_cart, only: [:index, :edit, :new, :show, :create, :destroy, :all_admins]
  before_filter :set_i18n_locale_from_params
  before_filter :header, :course
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


 
  protected

  def set_i18n_locale_from_params
    if params[:locale]
      if I18n.available_locales.include?(params[:locale].to_sym)
        I18n.locale = params[:locale]
      else
        flash[:notice] = "#{params[:locale]} translation not available"
        logger.error flash[:notice]
      end
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :email]
  end

  def slider
    @slickslider = Slider.all
    @i = 0
  end
	
  def nav_menu
     @catalogs = Catalog.all
  end
  
  def header
    @header = HeaderSite.first
  end

  def course
    @course = SettingPage.first.course
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def current_cart
    @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end

end


# Рабочий вариант в контрллере
# def nav_menu
#     @catalogs = Catalog.all
#      @catalogs.each do |catalogs|
#      @catid = Catalog.find(catalogs.id)
#        @catid.boxes.each do |box|
#           puts box.name
#         end
#     end
    
#   end



# Рабочий вариант вьюхи в разных партиалах
   # <% @catalogs.each do |catalogs| %>
   #    <% @catid = Catalog.find(catalogs.id) %>
   #      <% @catid.boxes.all.each do |box| %>
   #        <li><%= box.name %></li>
   #      <% end %>
   #  <% end %> 


# Рабочий вариант вьюхи2 вложенный вложенный в партиал _nav
   # <% @catid = Catalog.find(catalog.id) %>
   #      <% @catid.boxes.all.each do |box| %>
   #        <li><%= box.name %></li>
   #      <% end %>