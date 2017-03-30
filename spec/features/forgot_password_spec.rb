require 'rails_helper'

RSpec.feature "ForgotPassword", type: :feature do

context 'Clicking on the forgot your password link' do
  Steps 'Enter email_regexp' do
    Given 'A user with email george@example.com and password curiousmonkey' do
      @user = User.new
      @user.email = "george@example.com"
      @user.password = "curiousmonkey"
      @user.save!
    end
    Given 'I click on the send me reset password instructions link on the     password reset page' do
      visit 'users/password/new'
    end
    Then 'I see a form to fill out' do
      expect(page).to have_content("Email")
    end
    When 'I fill in the form' do
      fill_in 'Email', with: @user.email
      click_button 'Send me reset password instructions'
    end
    Then 'I see the the email sent message'
    # You will receive an email with instructions on how to reset your password in a few minutes.
    Then 'An email is sent to the user'

  end
end
end
