# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comment Model', type: :model do
  describe Comment do
    let!(:user) { create :user }
    let!(:post) { create :post, user_id: user.id }

    it 'Content Length valid' do
      comment = Comment.create(user_id: user.id, title: '01234567890123456789012345678901234567890123456789', content: '01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789')

      expect(comment.valid?)
    end

    it 'Content Length invalid' do
      comment = Comment.create(user_id: user.id, title: '01234567890123456789012345678901234567890123456789', content: '012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890')

      expect(comment.invalid?)
    end

    it 'Comment belongs to user' do
      expect(Comment)
    end
  end
end
