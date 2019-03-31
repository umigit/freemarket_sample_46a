
# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  prepend_before_action :check_captcha, only: [:create]

<<<<<<< HEAD
before_action :configure_sign_up_params, only: [:create]

=======
  
>>>>>>> origin/user-registration-new
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
  end




  def phone
  end





  def region
  end




  def credit
  end




  def complete
  end


  def create
    @user = User.new(sign_up_params)
    if @user.save
      redirect_to root_path
    else
      render 'sns'
    end
  end
<<<<<<< HEAD




  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up) do |params|
      params.permit(:email, :password, :password_confirmation,
                    user_profile_attributes: [:user_id, :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_y, :birth_m, :birth_d])

    end
  end
end













  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
=======
  
>>>>>>> origin/user-registration-new
  # def create
    # if verify_recaptcha
    #   super
    # else
    #   self.resource = resource_class.new
    #   respond_with_navigational(resource) { render :new }
    # end
  # end

  private

  def check_captcha
    unless verify_recaptcha
      self.resource = resource_class.new sign_up_params
      resource.validate # Look for any other validation errors besides Recaptcha
      set_minimum_password_length
      respond_with resource
    end
  end
 
end

