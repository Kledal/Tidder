class Subtidder < ActiveRecord::Base
  has_many :posts
  has_many :subscriptions
  has_many :users, through: :subscriptions
  validates :name, presence: true

  def to_param
    "#{id}-#{name}"
  end
end
