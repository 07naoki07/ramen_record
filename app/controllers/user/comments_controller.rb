class User::CommentsController < ApplicationController
    
 def create
  @record = Record.find(params[:record_id])
  @comment = current_user.records.new(record_comment_params)
  @comment.record_id =record.id
  @comment.save
  redirect_to record_path(record)
 end
 
  def destroy
    RecordComment.find(params[:id]).destroy
    redirect_to record_path(params[:record_id])
  end
  
  private
  def record_comment_params
   params.require(:record_comment).permit(:comment)
  end
 
end
