# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Post Model', type: :model do
  describe Post do
    let!(:user) { create :user }

    it 'Is not valid without a title' do
      post = Post.create(user_id: user.id, content: Faker::Lorem.characters(number: 500))

      expect(post).to_not be_valid
    end

    it 'Is not valid without a content' do
      post = Post.create(user_id: user.id, title: Faker::Lorem.characters(number: 50))

      expect(post).to_not be_valid
    end

    it 'Title Length valid' do
      post = Post.create(user_id: user.id, title: Faker::Lorem.characters(number: 50), content: Faker::Lorem.characters(number: 500))

      expect(post).to be_valid
    end

    it 'Title Length invalid' do
      post = Post.create(user_id: user.id, title: Faker::Lorem.characters(number: 51), content: Faker::Lorem.characters(number: 500))

      expect(post).to_not be_valid
    end

    it 'Content Length valid' do
      post = Post.create(user_id: user.id, title: Faker::Lorem.characters(number: 50), content: Faker::Lorem.characters(number: 500))

      expect(post).to be_valid
    end

    it 'Content Length invalid' do
      post = Post.create(user_id: user.id, title: Faker::Lorem.characters(number: 50), content: Faker::Lorem.characters(number: 501))

      expect(post).to_not be_valid
    end

    it 'Post belongs to user' do
      should belong_to(:user)
    end

    it 'Post has many comments' do
      should have_many(:comments)
    end
  end
end
