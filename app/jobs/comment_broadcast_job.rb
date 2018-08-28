class CommentBroadcastJob < ApplicationJob
  queue_as :default

  def perform_later(notification)
    html = ApplicationController.render partial: "comments/comment", locals: {body: comment}, formats: [:html]
    ActionCable.server.broadcast "comment:#{comment.user_id}", html: html
  end

end
