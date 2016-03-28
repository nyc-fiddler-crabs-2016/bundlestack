class Comment < ActiveRecord::Base

include Valueable

belongs_to :user
belongs_to :commentable, polymorphic: true
has_many   :votes, as: :votable, dependent: :destroy


  def author
    self.user.username
  end
end

