class User::LikesController < ApplicationController

  def create
    @record =Record.find(params[:record_id])
    like =current_user.likes.new(record_id: @record.id)
    like.save
    redirect_to request.referer
  end


  def destroy
    @record =Record.find(params[:record_id])
    like = current_user.likes.find_by(record_id: @record.id)
    like.destroy
    redirect_to request.referer
  end

end
