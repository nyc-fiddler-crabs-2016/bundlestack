class VotesController < ApplicationController

  def up
    binding.pry
    # redirect_to votes_pat hunless already_voted
    @vote = find_or_create_by(user_id: current_user.id, votable_id: params[:] )
    @vote.increment
  end

  def down
    @vote = find_or_create_by(user_id: current_user.id, votable_id: )
    @vote.decrement
  end

  def create
    @vote = find_or_create_by(user_id: current_user.id, votable_id: )
    if already_voted
      redirect_to vote_path, method: :delete
    else
      @vote = Vote.new(vote_param)
    end
  end

  def destroy
  end

  private

  def vote_param
    params.require(:vote).permit(:value).merge(user_id: current_user.id)
  end

end
