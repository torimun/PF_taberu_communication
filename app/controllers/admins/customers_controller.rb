class Admins::CustomersController < ApplicationController

  def index
    @customers = Customer.all.page(params[:page]).per(5)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update

  end


  private

  def customers_params
    params.require(:customer).permit(:user_name, :introduction, :is_deleted)
  end

end
