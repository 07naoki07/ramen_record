class User::CommentsController < ApplicationController

 def create
  @record = Record.find(params[:record_id])
  @comment = current_user.records.new(comment_params)
  @comment.record_id =@record.id
  @comment.save
  redirect_to request.referer
 end

  def destroy
    RecordComment.find(params[:id]).destroy
    redirect_to request.referer
  end

  private
  def comment_params
   params.require(:comment).permit(:comment)
  end

end
