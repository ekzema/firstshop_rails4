class HeaderSitesController < ApplicationController
  def index
    @header = HeaderSite.first    
    if @header.blank?
    	@header = HeaderSite.create(:title => "", :description => "", :author => "", :keywords => "")
      return 
    end
  end

  def update
    @header = HeaderSite.first
    respond_to do |format|
      if @header.update_attributes({:title => params[:t], :description => params[:d], :author => params[:a], :keywords => params[:k]})
        format.html { redirect_to :back, notice: 'Данные были успешно обновлены' }
        format.json { head :no_content }
      else
        format.html { render action: "index" }
        format.json { render json: @header.errors, status: :unprocessable_entity }
      end
    end
  end

  private
 
  def header_site_params
      params.require(:header_site).permit(:description, :title, :author, :keywords)
  end

end
