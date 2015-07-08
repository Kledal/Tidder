class CommentsController < ApplicationController
  before_filter :find_comment, only: [:show, :upvote, :downvote]
  before_filter :auth, only: [:upvote, :downvote]

  def new
    @new_comment = Comment.new
    @post = Comment.find(params[:comment_id])
  end

  def create
    @comment_on ||=  params[:comment_id].present? ? Comment.find(params[:comment_id]) : Post.find(params[:post_id])
    @post = params[:comment_id].present? ? @comment_on.commentable : @comment_on
    new_comment = Comment.build_from(@post, current_user.id, comment_params[:body])
    new_comment.save
    if params[:comment_id].present?
      new_comment.move_to_child_of(@comment_on)
    end
    redirect_to @post
  end

  def upvote
    @comment.upvote current_user
    render partial: 'comment', locals: { comment: @comment }, change: "comments:#{@comment.id}"
  end

  def downvote
    @comment.downvote current_user
    render partial: 'comment', locals: { comment: @comment }, change: "comments:#{@comment.id}"
  end

  private

  def find_comment
    id = params[:id]
    @comment = Comment.find(id)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
