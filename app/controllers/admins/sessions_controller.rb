class Admins::SessionsController < Devise::SessionsController
  layout "admins_devise_layout"
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
    def destroy
    cart_id = session[:cart_id] 
      super  #если нужно изменит "redirect_to" удаляем "super" и раскомментируем нижние строки!
      # igned_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)) 
      # set_flash_message :notice, :signed_out if signed_out && is_flashing_format?
      # yield if block_given?
      # redirect_to :back
    session[:cart_id] = cart_id
  end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
