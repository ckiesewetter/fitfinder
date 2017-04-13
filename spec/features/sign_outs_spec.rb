require 'rails_helper'

RSpec.feature "SignOuts", type: :feature do
  context "Sign out link not visible on Devise pages" do
    Steps "Logging out of a registered user account" do
      Given "I am a signed in user" do
        #In rspec there is no user user in the database so we create one.
        @user = User.new
        @user.email = "george@example.com"
        @user.password = "curiousmonkey"
        @user.save!
        visit '/'
        fill_in 'Email', with: 'george@example.com'
        fill_in 'Password', with: 'curiousmonkey'
        click_button 'Log in'
      end
      When "I click Sign Out I log out of the application" do
        within('div.hidden-xs') do
          click_link 'Sign Out'
        end
      end
      Then "I expect to see Log in on the users/sign_in page" do
        expect(page).to have_content("Log in")
      end
    end
  end
end
