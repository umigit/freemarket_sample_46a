class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_paramaters, if: :devise_controller?

  private

  def configure_permitted_paramaters
    devise_parameter_sanitizer.permit(:sign_up, keys: [user_profile_attributes: [:user_id, :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_y, :birth_m, :birth_d]])
  end
end
