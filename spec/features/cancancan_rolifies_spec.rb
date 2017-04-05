require 'rails_helper'

RSpec.feature "CancancanRolifies", type: :feature do
  context "Cancancan and Rolify sitewide" do
    Steps "Create roles and assign them" do
      Given "I am a registered user" do
        @user = User.new
        @user.email = "george@example.com"
        @user.password = "curiousmonkey"
        @user.save!
        visit '/'
        fill_in 'Email', with: 'george@example.com'
        fill_in 'Password', with: 'curiousmonkey'
        click_button 'Log in'
      end
      Then "" do
        # expect(page).to_not have_content
      end
    end
  end
end
