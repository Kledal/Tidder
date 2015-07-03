class HomeController < ApplicationController
  def frontpage
    @top_posts = Post.all
  end
end
