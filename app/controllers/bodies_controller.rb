class BodiesController < ApplicationController
  def show
    @body = Body.all
  end

  def destroy
    @body = Body.find(params[:id])
    @body.destroy
    respond_to do |format|
      format.html { redirect_to money_index_url, notice: 'Body was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
