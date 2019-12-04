# frozen_string_literal: true

class CommentBroadcastJob < ApplicationJob
  queue_as :default

  def perform(_comment)
    ActionCable.server.broadcast 'comments', message: _comment
  end
end
