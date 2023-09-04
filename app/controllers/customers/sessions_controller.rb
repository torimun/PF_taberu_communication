# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :configure_permitted_parameters

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to customers_homes_top_path,
    notice: 'ゲストユーザーとしてログインしました。ゲストユーザーでは編集機能以外利用可能です。'
  end

  def after_sign_in_path_for(resource)
    customers_homes_top_path
  end

  def after_sign_out_path_for(resource)
    customers_homes_welcome_path
  end


  # protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:user_name, :introduction])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
