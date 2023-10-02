class Admins::CustomersController < ApplicationController

  def index
    @customers = Customer.all.page(params[:page]).per(5)
  end

  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts.page(params[:page]).per(10)
  end

  def post_show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customers_params)
    redirect_to admins_customers_show_path(@customer.id)
  end


  private

  def customers_params
    params.require(:customer).permit(:user_name, :introduction, :is_deleted)
  end

end
