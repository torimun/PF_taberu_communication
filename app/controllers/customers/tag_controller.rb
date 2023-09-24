class Customers::TagController < ApplicationController

  def index
    @tags = Tag.all
  end

  def show
    @posts = Tag.find(params[:id]).posts
  end
end
