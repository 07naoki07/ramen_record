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
   if @record.save
    redirect_to record_path(@record.id)
   else
    render "new"
   end
  end

  def show
   @record = Record.find(params[:id])
   @genres = Genre.all
   gon.record = @record
   @user = @record.user
   @comment = Comment.new
   @comments = @record.comments
  end

  def edit
   @record = Record.find(params[:id])
   if @record.user == current_user
    render "edit"
   else
    render "index"
   end
  end

  def update
   @record = Record.find(params[:id])
   if @record.update(record_params)
    redirect_to record_path(@record.id)
   else
    render "edit"
   end
  end

  def destroy
    @record = Record.find(params[:id])
    @user = @record.user
    @record.destroy
    redirect_to user_path(@user.id)
  end

  private

  def record_params
   params.require(:record).permit(:user_id, :name, :shop_name, :caption, :rate, :address, :image, :date, :genre_id)
  end
end
