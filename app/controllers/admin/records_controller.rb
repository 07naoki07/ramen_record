class Admin::RecordsController < ApplicationController
  def index
    @records = Record.all
  end

  def destroy
   @record = Record.find(params[:id])
   @record.destroy
   redirect_to admin_records_path
  end
end
