class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    posts_path
  end
  
  def check_guest
    email = resource&.email || params[:user][:email].downcase
    if email == 'guest_user@example.com'
      redirect_to root_path, alert: 'ゲストユーザーは編集・削除できません！'
    end
  end
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name image])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name image])
  end
end