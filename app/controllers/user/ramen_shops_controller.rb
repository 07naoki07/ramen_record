class User::RamenShopsController < ApplicationController
  
  def index
   @ramen_shop = Ramen_Shop.new
   @ramen_shops = Ramen_Shop.all
  end
  
  def create
   @ramen_shop = Ramen_Shop.new(ramen_shop_params)
   if @ramen_shop.save
     redirect_to ramen_shops_path
   else
     render :index
   end
  end
  
  def show
   @ramen_shop = Ramen_Shop.find(params[:id])
  end
  
  def edit
    @ramen_shop = Ramen_Shop.find(params[:id])
  end
  
  def update
    @record = Record.find(params[:id])
    ramen_shop_list = params[:record][:ramen_shop].split(',')
    if @record.update(record_paramas)
       @record.save_ramen_shops(ramen_shop_list)
       redirect_to record_path(@record.id)
    else
      render index
    end
  end
  
  private
  
  def ramen_shop_params
    params.require(:record).permit(:user_id, :name, :shop_name, :caption, :rate, :address, :image)
  end
  
end
