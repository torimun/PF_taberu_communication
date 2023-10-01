class Customers::CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = current_customer.comments.new(comment_params)
    if @comment.save
      redirect_to customers_post_path(@post.id)
    else
      redirect_to customers_post_path(@post.id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:customer_id, :post_id, :comment)
  end

end
