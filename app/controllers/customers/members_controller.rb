class Customers::MembersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts.page(params[:page]).per(10)
    @comment = Comment.new
  end

  def edit
    @customer = current_customer
  end

  def update
    if @customer = current_customer
      @customer.update(customers_params)
      redirect_to customers_path(@customer)
    else
      render :show
    end
  end

  def confirm
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def customers_params
    params.require(:customer).permit(:user_name, :email, :introduction)
  end

end
