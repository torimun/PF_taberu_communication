class Customers::TagController < ApplicationController

  def index
    @tags = Tag.all
  end

  def show
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).post : Post.all
  end
end
