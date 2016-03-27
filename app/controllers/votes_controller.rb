class VotesController < ApplicationController

  def up
    @vote = Vote.find_or_create_by(user_id: current_user.id, votable_id: params[:votable_id], votable_type:params[:votable_type])
    @vote.increment
    binding.pry
    if request.xhr?
      render partial: 'votes/up_response', locals: {vote: @vote}, layout: false
    else
      redirect_to :back
    end
  end

  def down
    @vote = Vote.find_or_create_by(user_id: current_user.id, votable_id: params[:votable_id], votable_type:params[:votable_type])
    @vote.decrement
    redirect_to :back
  end
end
