class Customers::MembersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customers_params)
    redirect_to customers_members_profile_path(@csutomer)
  end

  def confirm
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to customers_homes_welcome_path
  end

  private

  def customers_params
    params.require(:customer).permit(:user_name, :introduction)
  end

end
