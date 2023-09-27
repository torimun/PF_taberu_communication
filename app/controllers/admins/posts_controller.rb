class Admins::PostsController < ApplicationController

  def index
    @post_for_admin = PostForAdmin.all
  end

  def show
    @post_for_admin = PostForAdmin.find(params[:id])
  end

  def create
    @post_for_admin = PostForAdmin.new(post_for_admin_params)
    @post_for_admin.save
    redirect_to admins_posts_path
  end

  private

  def post_for_admin_params
    params.require(:post_for_admin).permit(:image, :classification, :name, :detail, :usega)
  end
end
