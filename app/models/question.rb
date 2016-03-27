class Question < ActiveRecord::Base

  include Valueable

  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  has_many   :answers, dependent: :destroy

  has_many   :comments, as: :commentable, dependent: :destroy
  has_many   :votes, as: :votable,  dependent: :destroy

  def author
    self.user.username
  end

  def answer_count
    self.answers.count
  end

  def has_favorite?
    self.answers.pluck(:favorite).include?(true)
  end

end

