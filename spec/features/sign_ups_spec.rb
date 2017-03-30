require 'rails_helper'

RSpec.feature "SignUps", type: :feature do
  # As a user I can create an account with my email password, first and last name, and an avatar.
  context 'Clicking on the sign up link' do
    Steps 'Signing up' do
      Given 'I click on the sign up link on the homepage and am brought to the sign up page' do
        visit '/users/sign_up'
      end
      Then 'I see a form to fill out' do
        expect(page).to have_content("Sign up")
        expect(page).to have_content("Attach avatar")
        expect(page).to have_content("First name")
        expect(page).to have_content("Last name")
        expect(page).to have_content("Email")
        expect(page).to have_content("Password")
        expect(page).to have_content("Password confirmation")
      end
      When 'I fill in the form' do
        attach_file('user[image]', '/Users/learn/desktop/fitfinder/app/assets/images/ninja.png')
        fill_in 'First name', with: 'test'
        fill_in 'Last name', with: 'test2'
        fill_in 'Email', with: 'test@test.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
        click_button 'Sign up'
      end
    end
  end
end
