class HomesController < ApplicationController
  def top
   @records = Record.all.order("created_at DESC").limit(3)
   @all_ranks = Record.most_liked
  end
end
