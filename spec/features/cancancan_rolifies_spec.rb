require 'rails_helper'

RSpec.feature "CancancanRolifies", type: :feature do
  context "Cancancan and Rolify sitewide" do
    Steps "Create roles and assign them" do
      Given "I am a registered user" do
        @location = Location.new
        @location.name = "LEARN"
        @location.address = "704 J St."
        @location.city = "San Diego"
        @location.state = "CA"
        @location.zip = "92101"
        @location.save!
        @user = User.new
        @user.first_name = "Curious"
        @user.last_name = "George"
        @user.email = "george@example.com"
        @user.password = "curiousmonkey"
        @user.save!
        visit '/'
        fill_in 'Email', with: 'george@example.com'
        fill_in 'Password', with: 'curiousmonkey'
        click_button 'Log in'
      end
      When "I can click the new activity link" do
        click_link 'New Activity'
      end
      When "I can fill in form fields" do
        fill_in 'Name', with: 'Wind Sprints'
        fill_in 'Website', with: 'www.google.com'
        fill_in 'Description', with: 'Run fast'
        fill_in 'Location', with: @location.id
        fill_in 'Schedule', with: 'M-F'
        select 'Advanced', from: 'Fitness level'
        fill_in 'Requirement', with: 'Running Shoes'
        fill_in 'Pricing', with: '$5'
        click_button 'Create Activity'
      end
      Then "I go back to the landing page" do
        click_link 'Back'
        expect(page).to have_content("Show")
        expect(page).to have_content("Edit")
        expect(page).to have_content("Destroy")
      end
      Then "I logout" do
        click_link 'Sign Out'
      end
      Then "I Sign up as a new user" do
        click_link 'Sign up'
      end
      Then "I fill in the Sign up form" do
        attach_file('user[image]', '/Users/learn/Downloads/illustration.jpg')
        fill_in 'First name', with: 'test'
        fill_in 'Last name', with: 'test2'
        fill_in 'Email', with: 'test@test.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
        click_button 'Sign up'
      end
      When "I am redirected to the landing page" do
        expect(page).to have_content("Show")
        expect(page).to_not have_content("Edit")
        expect(page).to_not have_content("Destroy")
      end
      save_and_open_page
    end
  end
end
