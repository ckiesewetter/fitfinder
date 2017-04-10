require 'rails_helper'

RSpec.feature "TermsOfServices", type: :feature do
  context 'Creating a new activity with terms of service' do
    Steps 'Signing up' do
      Given 'I click on the sign up link on the homepage and am brought to the sign up page' do
        visit '/users/sign_up'
      end
      And 'I have a location' do
        @location = Location.new
        @location.name = "LEARN"
        @location.address = "704 J St."
        @location.city = "San Diego"
        @location.state = "CA"
        @location.zip = "92101"
        @location.save!
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
      Then 'I add a new activity by clicking the New Activity link' do
        click_link 'New Activity'
      end
      When 'I fill in the form without selecting the terms of service button' do
        fill_in 'Name', with: 'Wind Sprints'
        fill_in 'Website', with: 'www.google.com'
        fill_in 'Description', with: 'Run fast'
        fill_in 'Location', with: @location.id
        fill_in 'Schedule', with: 'M-F'
        fill_in 'Requirement', with: 'Shoes'
        fill_in 'Pricing', with: '$5'
        click_button 'Create Activity'
      end
      Then 'I see an error because the terms of service agreement has not been checked' do
        expect(page).to have_content("Terms of service must be accepted")
      end
      When 'I select the terms of service check box' do
        check('Terms of service')
        click_button 'Create Activity'
      end
      Then 'I can see that an activity was successfully created' do
        expect(page).to have_content("Activity was successfully created.")
      end
    end
  end
end
