class Comment < ActiveRecord::Base
belongs_to :user
belongs_to :commentable, polymorphic: true

  def author
    self.user.username
  end
end
