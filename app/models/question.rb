class Question < ActiveRecord::Base

  include Valueable

  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  has_many   :answers

  has_many   :comments, as: :commentable
  has_many   :votes, as: :votable

  def author
    self.user.username
  end

  def answer_count
    self.answers.count
  end
end

