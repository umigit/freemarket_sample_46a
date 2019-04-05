class CommentsController < ApplicationController

  def create
    Comment.create(content: comment_params[:content], item_id: comment_params[:item_id], user_id: current_user.id)

    redirect_to item_path(comment_params[:item_id])
  end


  private
  def comment_params
    params.require(:comment).permit(:content).merge(item_id: params[:item_id])
  end
end
