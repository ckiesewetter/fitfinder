require 'rails_helper'

RSpec.feature "GoogleMaps", type: :feature do
  context 'Going to landing page' do
    Steps 'Being welcomed' do
      Given 'I am on the landing page' do
        @user = User.new
        @user.email = "george@example.com"
        @user.password = "curiousmonkey"
        @user.save!
        visit '/'
        fill_in 'Email', with: 'george@example.com'
        fill_in 'Password', with: 'curiousmonkey'
        click_button 'Log in'
      end
      Then 'I can see a map of my current location with a marker' do
        expect(page).to have_content("Map")
        pending
      end
    end
  end
end
