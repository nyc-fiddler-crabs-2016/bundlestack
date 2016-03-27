class Answer < ActiveRecord::Base

  def question_owner_id
    self.question.user_id
  end

  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  private

end
