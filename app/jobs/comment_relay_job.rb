class CommentRelayJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    # html = ApplicationController.render partial: "comments/comm", locals: {user_id: user_id}, formats: [:html]
    # ActionCable.server.broadcast "comment:#{user_id}", html: html
    ac = ActionController::Base.new()
    ac.render_to_string(:partial => 'comments/comm', :locals => {:comment => Comment.last})

    # ActionCable.server.broadcast "chat_rooms_channel"
    # byebug
  end
end
