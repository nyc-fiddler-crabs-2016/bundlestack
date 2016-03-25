class Answer < ActiveRecord::Base

  include Valueable

  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
end
