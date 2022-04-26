class Admin::UserController < ApplicationController
  def index
    @users = User.all
  end

  def destroy
   @user = User.find(params[:id])
   @user.destroy
   redirect_to admin_user_index_path
  end
end