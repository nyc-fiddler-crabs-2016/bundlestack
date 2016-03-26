class VotesController < ApplicationController

  def up
    binding.pry
    @object = Vote.find_or_create_by(user_id, votable_type, votable_id)
    @object.vote.increment
  #   if already_voted
  #     redirect_to votes_path
  #   else
  #     @object = (user_id: current_user.id, votable_id: params[:] )
  #     @vote.increment
  # end

  def down
    @object = Vote.find_or_create_by(user_id, votable_type, votable_id)
    @object.vote.decrement
  end

  # def create
  #   @vote = find_or_create_by(user_id: current_user.id, votable_id: )
  #   if already_voted
  #     redirect_to vote_path, method: :delete
  #   else
  #     @vote = Vote.new(vote_param)
  #   end
  # end

  # def destroy
  # end

  private

  def vote_param
    params.require(:vote).permit(:value).merge(user_id: current_user.id)
  end

end
