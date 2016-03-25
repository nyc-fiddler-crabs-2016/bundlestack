module Valueable
  def vote
    self.votes.first
  end

  def total_votes
    Vote.where(votable_id: 1, votable_type: self.class).pluck(:value).reduce(:+)
  end
end
