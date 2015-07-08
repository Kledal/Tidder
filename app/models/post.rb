class Post < ActiveRecord::Base
  acts_as_votable
  acts_as_commentable

  belongs_to :user
  belongs_to :subtidder
  has_many :comments, as: :commentable

  validates :title, :subtidder, presence: true

  def upvote(user)
    if user.downvoted?(self) || !user.has_voted(self)
      upvote_by(user)
    else
      unliked_by(user)
    end
  end

  def downvote(user)
    if user.upvoted?(self) || !user.has_voted(self)
      downvote_from(user)
    else
      undisliked_by(user)
    end
  end

  def score
    get_upvotes.size - get_downvotes.size
  end
end
