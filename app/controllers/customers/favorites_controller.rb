class Customers::FavoritesController < ApplicationController

  def create
    posts = Post.find(params[:post_id])
    favorite = current_customer.favorites.new(post_id: posts.id)
    favorite.save
    redirect_to customers_post_path(posts)
  end

  def destroy
    posts = Post.find(params[:post_id])
    favorite = current_customer.favorites.find_by(post_id: posts.id)
    favorite.destroy
    redirect_to customers_post_path(posts)
  end
end
