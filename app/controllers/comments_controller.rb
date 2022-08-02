class CommentsController < ApplicationController
  before_action :require_user

  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.build(comment_params)
    @comment.chef = current_chef

    if @comment.save
      flash[:success] = "Comment was created Successfully"
      redirect_to item_path(@item)
    else
      flash[:danger] = "Comment was not created"

      redirect_to item_path(@item)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description)
  end
end
