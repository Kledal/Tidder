class PostsController < ApplicationController
  before_filter :find_post, only: [:show, :upvote, :downvote]

  def show
    @root_comments = @post.root_comments
  end

  def new

  end

  def upvote
    @post.upvote current_user
    render partial: 'post', locals: { post: @post }, change: "posts:#{@post.id}"
  end

  def downvote
    @post.downvote current_user
    render partial: 'post', locals: { post: @post }, change: "posts:#{@post.id}"
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end
end
