class Admins::PostsController < ApplicationController

  def index

  end

  def show
    @post = Post.find(params[:id])
  end

  def create

  end
end
