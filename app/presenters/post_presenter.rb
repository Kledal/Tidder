class PostPresenter < BasePresenter

  def total_upvotes
    @model.get_upvotes.size
  end

  def total_downvotes
    @model.get_downvotes.size
  end

  def link
    return @model.link if @model.link.present?
    return @model
  end

  def submitted_by
    @view.link_to @model.user.username, @model.user
  end
end
