class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about] #ユーザ認証なし
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
  end

  def after_sign_out_path_for(resource)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password])
  end
end
