class Customers::MembersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customers_members_profile_path(@csutomer.id)
  end

  def confirm

  end

  def withdraw

  end

  private

  def customers_params
    params.require(:customer).permit(:user_name, :introduction)
  end

end
