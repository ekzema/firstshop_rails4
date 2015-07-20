class FiltrsController < ApplicationController
	before_action :authenticate_admin!
	  def create
	     @box = Box.find(params[:box_id])
	     @filtr = @box.filtrs.create(filtr_params)
	  end

private
  def filtr_params
      params.require(:filtr).permit(:body)
  end

end
