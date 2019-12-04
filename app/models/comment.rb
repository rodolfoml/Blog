# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :post_id, presence: true
  validates :content, length: { maximum: 250 }, presence: true

  after_create_commit { CommentBroadcastJob.perform_now self }
end
