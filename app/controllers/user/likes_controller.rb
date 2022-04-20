class User::LikesController < ApplicationController

  def create
    @record =Record.find(params[:record_id])
    like =current_user.likes.new(record_id: @record.id)
    like.save
  end


  def destroy
    @record =Record.find(params[:record_id])
    like = current_user.likes.find_by(record_id: @record.id)
    like.destroy
  end

end
