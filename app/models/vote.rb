class Vote < ActiveRecord::Base
  validates :value, :inclusion => {:in => [-1,0,1]}
  # validates :question, :answer, :comment , uniqueness: {scope: :user, message: "you already voted on this"}
  belongs_to :user
  belongs_to :votable, polymorphic: true

  def increment
    val = self.value
    self.update_attributes(value: val + 1)
  end

  def decrement
    val = self.value
    self.update_attributes(value: val - 1)
  end

  end
end
