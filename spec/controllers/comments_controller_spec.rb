# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Blog API', type: :request do
  describe 'GET /comments/{post-slug}?post_id={post_id}' do
    let!(:user) { create :user }
    let!(:post1) { create :post, user_id: user.id }
    let!(:post2) { create :post, user_id: user.id }
    let!(:comment1) { create :comment, user_id: user.id, post_id: post1.id }
    let!(:comment2) { create :comment, user_id: user.id, post_id: post1.id }
    let!(:comment3) { create :comment, user_id: user.id, post_id: post2.id }

    it 'List comments by post' do
      get "/comments/#{post1.slug}?post_id=#{post1.id}"

      expect(response.body.include?(comment1.content))
      expect(response.body.include?(comment2.content))
      expect(response.body.exclude?(comment3.content))
    end
  end

  describe 'POST /comments' do
    let!(:user) { create :user }
    let!(:post) { create :post, user_id: user.id }

    let(:post_params) do
      {
        user_id: user.id,
        post_id: post.id,
        comment: {
          content: 'Content'
        }
      }
    end

    it 'Creating a comment' do
      post '/comments', params: post_params
      puts response.body

      get "/comments/#{post.slug}?post_id=#{post.id}"

      expect(response.body.include?(post_params[:comment][:content]))
    end
  end

  describe 'PUT /comments/{comment_id}' do
    let!(:user) { create :user }
    let!(:post) { create :post, user_id: user.id }
    let!(:comment) { create :comment, user_id: user.id, post_id: post.id }

    let(:post_params) do
      {
        user_id: user.id,
        post_id: post.id,
        comment: {
          content: 'Content updated'
        }
      }
    end

    it 'Updating a comment' do
      put "/comments/#{comment.id}", params: post_params

      get "/comments/#{post.slug}?post_id=#{post.id}"

      expect(response.body.include?(comment.content))
    end
  end

  describe 'DELETE /comments/{comment_id}' do
    let!(:user) { create :user }
    let!(:post) { create :post, user_id: user.id }
    let!(:comment1) { create :comment, user_id: user.id, post_id: post.id }
    let!(:comment2) { create :comment, user_id: user.id, post_id: post.id }

    it 'Deleting a comment' do
      get "/comments/#{post.slug}?post_id=#{post.id}"
      expect(response.body.include?(comment1.content))
      expect(Comment.count).to eq(2)

      delete "/comments/#{comment1.id}"

      get "/comments/#{post.slug}?post_id=#{post.id}"
      expect(response.body.exclude?(comment1.content))
      expect(Comment.count).to eq(1)
    end
  end
end
