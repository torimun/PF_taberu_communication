class Customers::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = current_customer.posts.build(post_params)
    if @post.save
      # 投稿が保存された場合はタグも保存する
      @post.save_tags(params[:post][:tag])
      #保存成功で投稿詳細へ
      redirect_to customers_post_path(@post.id)
    else
      #失敗した場合は投稿画面に戻る
      redirect_to new_customers_post_path
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = current_customer.comments.new
  end

  private

  def post_params
    params.require(:post).permit(:customer_id, :genre, :comment, images: [])
  end

end
