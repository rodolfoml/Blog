# frozen_string_literal: true

require 'spec_helper'

feature 'Create Comment' do
  describe 'Success' do
    it 'Comment Created' do
      user = create :user
      title = Faker::Lorem.characters(number: 30)
      post = Post.create(user_id: user.id, title: title, content: Faker::Lorem.characters(number: 100))

      visit '/users/sign_in'
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log In'

      visit "/comments/new?post_id=#{post.id}"

      content = Faker::Lorem.characters(number: 100)
      fill_in 'comment_content', with: content
      click_button 'Publish'

      visit "comments/#{post.slug}?post_id=#{post.id}"

      expect(page).to have_content(content)
    end
  end

  describe 'Fail' do
    it 'Comment Not Created' do
      user = create :user
      title = Faker::Lorem.characters(number: 30)
      post = Post.create(user_id: user.id, title: title, content: Faker::Lorem.characters(number: 100))

      visit '/users/sign_in'
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log In'

      visit "/comments/new?post_id=#{post.id}"

      fill_in 'comment_content', with: ''
      click_button 'Publish'

      visit "comments/#{post.slug}?post_id=#{post.id}"

      expect(page).to have_no_content('Posted')
    end
  end
end
