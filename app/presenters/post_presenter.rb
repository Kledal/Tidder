class PostPresenter < BasePresenter
  def total_comments
    @model.comment_threads.size
  end

  def total_upvotes
    @model.get_upvotes.size
  end

  def total_downvotes
    @model.get_downvotes.size
  end

  def link
    return @model.link if @model.link.present?
    [@model.subtidder, @model]
  end

  def subtidder_name
    return @model.link if @model.link.present?
    link_str = "(#{I18n.t('globals.self')}.#{@model.subtidder.name})"
    h.link_to link_str, @model.subtidder
  end

  def submitted_by
    @view.link_to @model.user.username, @model.user
  end
end
