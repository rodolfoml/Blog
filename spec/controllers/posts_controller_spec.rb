# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Blog API', type: :request do
  describe 'GET /posts' do
    let!(:user) { create :user }
    let!(:post1) { create :post, user_id: user.id }
    let!(:post2) { create :post, user_id: user.id }

    it 'List all posts' do
      get '/posts'

      expect(response.body.include?(post1.title))
      expect(response.body.include?(post1.content))
      expect(response.body.include?(post2.title))
      expect(response.body.include?(post2.content))
    end

    it 'List a post' do
      get "/posts/#{post1.slug}"

      expect(response.body.include?(post1.title))
      expect(response.body.include?(post1.content))
      expect(response.body.exclude?(post2.title))
      expect(response.body.exclude?(post2.content))
    end
  end

  describe 'POST /posts' do
    let!(:user) { create :user }

    let(:post_params) do
      {
        user_id: user.id,
        post: {
          title: 'Title',
          content: 'Content'
        }
      }
    end

    it 'Creating a post' do
      post '/posts', params: post_params

      get '/posts'

      expect(response.body.include?(post_params[:post][:title]))
      expect(response.body.include?(post_params[:post][:content]))
    end
  end

  describe 'PUT /posts/{post-slug}' do
    let!(:user) { create :user }
    let!(:post1) { create :post, user_id: user.id }

    let(:post_params) do
      {
        user_id: user.id,
        post: {
          title: 'Title updated',
          content: 'Content updated'
        }
      }
    end

    it 'Updating a post' do
      put "/posts/#{post1.slug}", params: post_params

      get "/posts/#{post1.slug}"

      expect(response.body.include?(post_params[:post][:title]))
      expect(response.body.include?(post_params[:post][:content]))
    end
  end

  describe 'DELETE /posts/{post-slug}' do
    let!(:user) { create :user }
    let!(:post1) { create :post, user_id: user.id }
    let!(:post2) { create :post, user_id: user.id }

    it 'Deleting a post' do
      get '/posts'
      expect(response.body.include?(post1.title))
      expect(Post.count).to eq(2)

      delete "/posts/#{post1.slug}"

      get '/posts'
      expect(response.body.exclude?(post1.title))
      expect(Post.count).to eq(1)
    end
  end
end
