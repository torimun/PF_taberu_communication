class Customers::LikesController < ApplicationController
  before_action :set_customer, only: [:like]

  def like
    like = Favorite.where(customer_id: @customer.id).pluck(:post_id)
    @posts = Post.find(like)
    @himself = current_customer.user_name
  end

  private

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end
end
