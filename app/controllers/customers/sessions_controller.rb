# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :customer_state, only: [:create]
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


  private

  def customer_state
    # 【処理内容1】 入力されたemailからアカウントを1件取得
    @customer = Customer.find_by(email: params[:customer][:email])
    # アカウントを取得できなかった場合、このメソッドを終了する
    return if !@customer
    # 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかつ、is_deletedの値がtrueであるか
    if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == true)
        redirect_to customers_homes_welcome_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:user_name, :introduction])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
