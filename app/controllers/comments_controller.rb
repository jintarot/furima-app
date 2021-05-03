class CommentsController < ApplicationController
  before_action:authenticate_user!
  def create
    @comment = Comment.new(comment_params)
    
    if @comment.valid?
      @comment.save
      redirect_to item_path(params[:item_id])
    else
      render :create
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:content).merge(item_id:params[:item_id],user_id:current_user.id)
  end
end
