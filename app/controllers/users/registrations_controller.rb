
# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  prepend_before_action :check_captcha, only: [:create]

  
  def sns
    @user = User.new(
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password],
      )
  end

  def create
  end
  
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

