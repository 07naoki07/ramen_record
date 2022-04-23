class User::CommentsController < ApplicationController

 def index
  @record = Record.find(params[:record_id])
  @comments =@record.comments
 end

 def create
  @record = Record.find(params[:record_id])
  @comment = current_user.comments.new(comment_params)
  @comment.record_id =@record.id
  @comment.save
  redirect_to request.referer
 end

  def destroy
   @record = Record.find(params[:record_id])
   @comment = @record.comments.find(params[:id])
   @comment.destroy
   redirect_to request.referer
  end

  private
  def comment_params
   params.require(:comment).permit(:comment)
  end

end
