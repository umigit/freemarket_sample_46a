# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_account_update_params, only: [:update]
  # prepend_before_action :check_captcha, only: [:create]

  before_action :configure_sign_up_params, only: [:create]

  def sns
    @user = User.new(
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password]
      )
    @user.build_user_profile(
      nickname: session[:nickname],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birth_y: session[:birth_y],
      birth_m: session[:birth_m],
      birth_d: session[:birth_d]
      )
    @user.build_address(
      relative_last_name: session[:relative_last_name],
      relative_first_name: session[:relative_first_name],
      relative_last_name_kana: session[:relative_last_name_kana],
      relative_first_name_kana: session[:relative_first_name_kana],
      postal_code: session[:postal_code],
      city: session[:city],
      block: session[:block],
      building: session[:building],
      prefecture_id: session[:prefecture_id],
      home_phone: session[:home_phone]
      )
  end



  def create
    @user = User.new(sign_up_params)
    if @user.save

    else
      render :sns
      flash[:notice] = "メールアドレスに誤りがあります。ご確認いただき、正しく変更してください。"
    end
  end



  def phone
  end





  def address
    @address = Address.new(
      relative_last_name: session[:relative_last_name],
      relative_first_name: session[:relative_first_name],
      relative_last_name_kana: session[:relative_last_name_kana],
      relative_first_name_kana: session[:relative_first_name_kana],
      postal_code: session[:postal_code],
      city: session[:city],
      block: session[:block],
      building: session[:building],
      prefecture_id: session[:prefecture_id],
      home_phone: session[:home_phone]
      )
  end



  def credit
  end




  def complete
  end







  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up) do |params|
      params.permit(:email, :password, :password_confirmation,
                    user_profile_attributes: [:user_id, :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_y, :birth_m, :birth_d, :movile_phone, :card_number, :expiration_month, :expiration_year, :security_code],
                    address_attributes: [:postal_code, :city, :block, :building, :user_id, :prefecture_id, :relative_last_name, :relative_first_name, :relative_last_name_kana, :relative_first_name_kana, :home_phone]
                    )

    end
  end

  def address_params
    params.require(:address).permit(:postal_code, :city, :block, :building, :user_id, :prefecture_id, :relative_last_name, :relative_first_name, :relative_last_name_kana, :relative_first_name_kana, :home_phone)
  end
end






  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource

  # def create
    # if verify_recaptcha
    #   super
    # else
    #   self.resource = resource_class.new
    #   respond_with_navigational(resource) { render :new }
    # end
  # end


#   private

#   def check_captcha
#     unless verify_recaptcha
#       self.resource = resource_class.new sign_up_params
#       resource.validate # Look for any other validation errors besides Recaptcha
#       set_minimum_password_length
#       respond_with resource
#     end
#   end

# end

