class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_paramaters, if: :devise_controller?

  private

  def configure_permitted_paramaters
    devise_parameter_sanitizer.permit(:sign_up, keys: [user_profile_attributes: [:user_id, :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_y, :birth_m, :birth_d, :movile_phone, :card_number, :expiration_month, :expiration_year, :security_code]])

    devise_parameter_sanitizer.permit(:sigin_up, keys: [address_attributes: [:postal_code, :city, :block, :building, :user_id, :prefecture_id, :relative_last_name, :relative_first_name, :relative_last_name_kana, :relative_first_name_kana, :home_phone]])

  end
end
