class PostsController < ApplicationController

  before_filter :find_post, only: [:upvote, :downvote]

  def upvote
    @post.upvote_by current_user
  end

  def downvote
    @post.downvote_from current_user
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end
end
