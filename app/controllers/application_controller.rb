class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
　
　def set_search
  @search = Record.ransack(params[:q])
  @search_records = @search.result.includes(:author, :terms).order(created_at: :desc).page(params[:page])
　end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys:[:introduction])
  end
end
