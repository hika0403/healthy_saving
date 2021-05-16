class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:lp]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    money_index_path
  end

  def after_inactive_sign_in_path_for(_resource)
    money_index_path
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:family_name, :given_name, :nickname, :birth_day])
  end
end
