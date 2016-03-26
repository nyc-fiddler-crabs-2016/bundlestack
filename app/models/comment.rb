class Comment < ActiveRecord::Base

include Valueable

belongs_to :user
belongs_to :commentable, polymorphic: true
has_many   :votes, as: :votable


  def author
    self.user.username
  end
end
