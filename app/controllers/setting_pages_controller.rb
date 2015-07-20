class SettingPagesController < ApplicationController
  def index
  	@setting = SettingPage.first    
   		if @setting.course.blank? or @setting.course < "1" 
    		@setting = SettingPage.create(:course => 1)
      return 
    end
  end

	def update
    @setting = SettingPage.first 
    respond_to do |format|
      if @setting.update_attributes({:course => params[:course], :comments => params[:comments], :sliders => params[:sliders]})
        format.html { redirect_to :back, notice: 'Данные были успешно обновлены' }
        format.json { head :no_content }
      else
        format.html { render action: "index" }
        format.json { render json: @header.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def setting_page_params
    params.require(:setting_page).permit!
  end
end
