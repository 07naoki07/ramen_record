class User::RecordsController < ApplicationController

  def new
   @record = Record.new
  end

  def index
   @total_records =Record.all
   @records =Record.page(params[:page])
  end

  def create
   @record = Record.new(record_params)
   @record.user_id = current_user.id
   @record.save
   redirect_to records_path
  end

  def show
   @record = Record.find(params[:id])
   @user = @record.user
   @comment = Comment.new
   @comments = @record.comments
  end

  def edit
   @record = Record.find(params[:id])
   if @record == current_user
    render "edit"
   else
    redirect_to records_path
   end
  end

  def update
   @record = Record.find(params[:id])
   @record.update(record_params)
   redirect_to record_path(@record.id)
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    redirect_to records_path
  end

  private

  def record_params
   params.require(:record).permit(:user_id, :name, :shop_name, :caption, :rate, :address, :image)
  end
end
