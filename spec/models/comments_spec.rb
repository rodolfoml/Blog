# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comment Model', type: :model do
  describe Comment do
    let!(:user) { create :user }
    let!(:post) { create :post, user_id: user.id }

    it 'Is not valid without a content' do
      comment = Comment.create(user_id: user.id, post_id: post.id)

      expect(comment).to_not be_valid
    end

    it 'Content Length valid' do
      comment = Comment.create(user_id: user.id, post_id: post.id, content: Faker::Lorem.characters(number: 250))

      expect(comment).to be_valid
    end

    it 'Content Length invalid' do
      comment = Comment.create(user_id: user.id, post_id: post.id, content: Faker::Lorem.characters(number: 251))

      expect(comment).to_not be_valid
    end

    it 'Comment belongs to user' do
      should belong_to(:user)
    end

    it 'Comment belongs to post' do
      should belong_to(:user)
    end
  end
end
