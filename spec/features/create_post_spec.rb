# frozen_string_literal: true

require 'spec_helper'

feature 'Create Post' do
  describe 'Success' do
    it 'Post Created' do
      user = create :user

      visit '/users/sign_in'
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log In'

      title = Faker::Lorem.characters(number: 30)

      visit '/posts/new'
      fill_in 'post_title', with: title
      fill_in 'post_content', with: 'Content'
      click_button 'Publish'

      expect(page).to have_content(title)
    end
  end

  describe 'Fail' do
    it 'Post Not Created' do
      user = create :user

      visit '/users/sign_in'
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log In'

      title = Faker::Lorem.characters(number: 30)

      visit '/posts/new'
      fill_in 'post_title', with: title
      fill_in 'post_content', with: ''
      click_button 'Publish'

      expect(page).to have_content('error')
    end
  end
end
