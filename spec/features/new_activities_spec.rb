require 'rails_helper'

RSpec.feature "NewActivities", type: :feature do
  context "Activities Page" do
    Steps "Going to Activities Page" do
      Given "I have an activity" do
        @location = Location.new
        @location.name = "LEARN"
        @location.address = "704 J St."
        @location.city = "San Diego"
        @location.state = "CA"
        @location.zip = "92101"
        @location.save!
        @user = User.new
        @user.email = "george@example.com"
        @user.password = "curiousmonkey"
        @user.save!
        visit '/'
        fill_in 'Email', with: 'george@example.com'
        fill_in 'Password', with: 'curiousmonkey'
        click_button 'Log in'
      end
      Then "I see Welcome to FindFit" do
        expect(page).to have_content("FindFit")
      end
      When "I can click the new activity link" do
        click_link 'New Activity'
      end
      Then "I am taken to a page that shows form fields" do
        expect(page).to have_content("New Activity")
        expect(page).to have_content("Name")
        expect(page).to have_content("Website")
        expect(page).to have_content("Description")
        expect(page).to have_content("Next at")
        expect(page).to have_content("Location")
        expect(page).to have_content("Schedule")
      end
      When "I can fill in form fields" do
        fill_in 'Name', with: 'Wind Sprints'
        fill_in 'Website', with: 'www.google.com'
        fill_in 'Description', with: 'Run fast'
        select 'LEARN', from: 'Location'
        fill_in 'Schedule', with: 'M-F'
        fill_in 'Requirement', with: 'Shoes'
        fill_in 'Pricing', with: 'Free'
        check('Terms of service')
        click_button 'Create Activity'
      end
      Then 'I am taken to a page showing my new Activity' do
        expect(page).to have_content("Activity was successfully created.")
        expect(page).to have_content("Wind Sprints")
        expect(page).to have_content("www.google.com")
        expect(page).to have_content("Run fast")
        expect(page).to have_content("Free")
        expect(page).to have_content("Shoes")
        expect(page).to have_content("M-F")
      end
    end
  end
end
