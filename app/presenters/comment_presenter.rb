class CommentPresenter < BasePresenter
  def submitted_by
    @view.link_to @model.user.username, @model.user
  end
end
