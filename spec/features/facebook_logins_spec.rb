require 'rails_helper'

RSpec.feature "FacebookLogins", type: :feature do
  Steps 'Sign in with Facebook' do
    Given 'I am on the landing page' do
      visit '/'
      Then "As a user I can see a login page" do
        expect(page).to have_content("Log in")
        expect(page).to have_content("Sign in with Facebook")
      end
    end
  end
end
