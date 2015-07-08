class HomeController < ApplicationController
  def frontpage
    @top_posts = Post.includes(:user, :comment_threads).limit(20)
  end
end
