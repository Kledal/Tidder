class AddSubtidderToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :subtidder, index: true, foreign_key: true
  end
end
