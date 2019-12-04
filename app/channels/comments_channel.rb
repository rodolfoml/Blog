# frozen_string_literal: true

class CommentsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'comments'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def comment(data)
    Comment.create! content: data['message']['content'], user_id: data['message']['user_id'], post_id: data['message']['post_id']
  end
end
