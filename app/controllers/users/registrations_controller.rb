# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  # prepend_before_action :check_captcha, only: [:create]

  # def create
    # if verify_recaptcha
    #   super
    # else
    #   self.resource = resource_class.new
    #   respond_with_navigational(resource) { render :new }
    # end
  # end


  # def sign_up
  # end

  # private

  # def check_captcha
  #   unless verify_recaptcha
  #     self.resource = resource_class.new sign_up_params
  #     resource.validate # Look for any other validation errors besides Recaptcha
  #     set_minimum_password_length
  #     respond_with resource
  #   end
  # end

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

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up) do |params|
      params.permit(:email, :password, user_profile_attributes: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_y, :birth_m, :birth_d])
    end
  end

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
end
