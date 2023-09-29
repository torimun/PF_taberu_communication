class Admins::PostsController < ApplicationController

  def index
    @post_for_admin = PostForAdmin.all
  end

  def show
    @post_for_admin = PostForAdmin.find(params[:id])
    @seasoning_spice = SeasoningSpice.new
  end

  def create
    @seasoning_spice = current_admin.seasoning_spices.build(seasoning_spice_params)
    if @seasoning_spice.save
      redirect_to admins_posts_path
    else
      render :new
    end
  end

  private

  def post_for_admin_params
    params.require(:post_for_admin).permit(:image, :classification, :name, :detail, :usega)
  end

  def seasoning_spice_params
    params.require(:seasoning_spice).permit(:image, :classification, :name, :detail, :usega)
  end
end
