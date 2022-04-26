class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_search

  before_action :authenticate_user!,only: [:show, :edit]



  def after_sign_up_path_for(resource)
   case resource
   when Admin
    root_path
   when User
    records_path
   end
  end

  def after_sign_in_path_for(resource)
   case resource
   when Admin
    root_path
   when User
    records_path
   end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
        root_path
    elsif resource_or_scope == :admin
        new_admin_session_path
    else
        root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def set_search
   @q = Record.ransack(params[:q])
   @records = @q.result(distinct: true)
  end

  def redirect_root
  redirect_to root_path unless user_signed_in?
  end

end
