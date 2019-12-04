# frozen_string_literal: true

require 'spec_helper'

feature 'Login' do
  describe 'Success' do
    it 'Login Success' do
      user = create :user

      visit '/users/sign_in'
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log In'

      expect(page).to have_content('Create a post')
    end
  end

  describe 'Fail' do
    it 'Login Fail' do
      user = create :user

      visit '/users/sign_in'
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: 'user.password'
      click_button 'Log In'

      expect(page).to have_no_content('Create a post')
    end
  end
end
