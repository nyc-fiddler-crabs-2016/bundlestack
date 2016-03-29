class Answer < ActiveRecord::Base

  def question_owner_id
    self.question.user_id
  end
  
  include Valueable

  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable,  dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy

  private

end
