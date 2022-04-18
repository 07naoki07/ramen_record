class Admin::RecordsController < ApplicationController
  def index
    @records = Record.all
    @user = User.all
  end
end
