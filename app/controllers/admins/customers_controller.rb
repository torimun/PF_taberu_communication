class Admins::CustomersController < ApplicationController

  def index
    @customers = Customer.all.page(params[:page]).per(10)
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
    if @customer.update(customers_params)
      redirect_to admins_customers_show_path(@customer.id)
    else
      render:edit
    end
  end

  def comment_destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      redirect_to admins_customers_post_show_path(@post.id)
    else
      render:post_show
    end
  end

  private

  def customers_params
    params.require(:customer).permit(:user_name, :email, :introduction, :is_deleted)
  end

  def comment_params
    params.require(:comment).permit(:customer_id, :post_id, :comment)
  end

end
