class User < ActiveRecord::Base
  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true

  has_many :posts
  has_many :comments

  def last_vote(post)
    voted_as_when_voted_for(post)
  end

  def upvoted?(post)
    last_vote(post) == true
  end

  def downvoted?(post)
    last_vote(post) == false
  end

  def has_voted(post)
    !voted_as_when_voted_for(post).nil?
  end
end
