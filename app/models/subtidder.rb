class Subtidder < ActiveRecord::Base
  has_many :posts
  validates :name, presence: true

  def to_param
    "#{id}-#{name}"
  end
end
