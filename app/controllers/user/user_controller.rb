class User::UserController < ApplicationController
  def show
   @user = User.find(params[:id])
   @records = @user.records
  end

 def index
   @users = User.all
 end

 def edit
   @user = User.find(params[:id])
   if @user == current_user
    render "edit"
   else
    redirect_to user_path(current_user)
   end
 end

  def update
    @user = User.find(params[:id])
   if @user.update(user_params)
    flash[:notice] = "successfully"
    redirect_to user_path(current_user)
   else
    render :edit
   end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
