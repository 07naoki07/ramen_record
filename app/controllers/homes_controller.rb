class HomesController < ApplicationController
  def top
   @records = Record.all.order("created_at DESC").limit(3)
   @all_ranks = Record.find(Like.group(:record_id).order('count(record_id) desc').limit(3).pluck(:record_id))
  end
end
