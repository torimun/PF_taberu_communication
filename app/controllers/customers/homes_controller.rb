class Customers::HomesController < ApplicationController

  def top
    @seasonings_spices = SeasoningSpice.all
  end

  def welcome

  end

  def new
    @post_for_admin = PostForAdmin.new
  end

  def create
    @post_for_admin = current_customer.post_for_admins.build(post_for_admin_params)
    if @post_for_admin.save
      redirect_to customers_homes_post_index_path
    else
      render :new
    end
  end

  def post_index
    @customer = current_customer
    @post_for_admin = @customer.post_for_admins.all
  end

  def show

  end

  private

  def post_for_admin_params
    params.require(:post_for_admin).permit(:image, :classification, :name, :detail, :usega)
  end

end
