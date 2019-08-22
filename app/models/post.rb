# frozen_string_literal: true

class Post < ApplicationRecord
  extend FriendlyId
  belongs_to :user
  has_many :comments, dependent: :destroy

  friendly_id :title, use: :slugged

  validates :title, length: { maximum: 50 }, presence: true
  validates :content, length: { maximum: 500 }, presence: true
end
