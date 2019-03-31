class Users::RegistrationsController < Devise::RegistrationsController

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
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

