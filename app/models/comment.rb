class Comment < ActiveRecord::Base

include Valueable

belongs_to :user
belongs_to :commentable, polymorphic: true
has_many   :votes, as: :votable, dependent: :destroy


  def author
    self.user.username
  end

  def source
    if self.commentable_type == "Answer"
      @answer = Answer.find(self.commentable_id)
    else
      @question = Question.find(self.commentable_id)
    end
  end
end

