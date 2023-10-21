class Admins::PostsController < ApplicationController

  def index
    @post_for_admin = PostForAdmin.all
  end

  def show
    @post_for_admin = PostForAdmin.find(params[:id])
    @seasoning_spice = SeasoningSpice.new
  end

  #以下の部分で、会員からの管理者向け投稿の「承認」or「拒否」を行っている

  #21~23のコードで、承認されたものに関しては一度投稿されたものから画像をコピーして、
  #新しく投稿するものに、attachしている。

  def create
    @post_for_admin = PostForAdmin.find_by(params[:id])
    @seasoning_spice = current_admin.seasoning_spices.build(seasoning_spice_params)

    image_file = ActiveStorage::Blob.service.send(:path_for, @post_for_admin.image.key)
    downloaded_image = open(image_file)
    @seasoning_spice.image.attach(io: downloaded_image, filename: @post_for_admin.image.filename)

    if @seasoning_spice.save
      @post_for_admin.destroy
      flash[:info] = "投稿が承認されました"
      redirect_to admins_posts_path
    else
      render :show
    end
  end

  def destroy
    @post_for_admin = PostForAdmin.find(params[:id])
    @post_for_admin.destroy
    flash[:info] = "投稿が承認拒否とされました"
    redirect_to admins_posts_path
  end

  private

  def post_for_admin_params
    params.require(:post_for_admin).permit(:image, :classification, :name, :detail, :usega)
  end

  def seasoning_spice_params
    params.require(:seasoning_spice).permit(:image, :classification, :name, :detail, :usega)
  end
end
