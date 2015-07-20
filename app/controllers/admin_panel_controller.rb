class AdminPanelController < ApplicationController
before_action :authenticate_admin!
before_action :rootadmin

  def index
  	@total_orders = Order.count
  	@product = Product.all
  end

	def all_admins
	@admins = Admin.all
	end

	def rootadmin
		@rootadmin = 'rootadmin'
	end

end
