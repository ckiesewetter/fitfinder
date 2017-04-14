require 'rails_helper'

RSpec.feature "AddLocationToActivities", type: :feature do
  context "Adding a location when adding an activity" do
    Steps "Adding a new activity and location" do
      Given "I am a signed in user" do
        #In rspec there is no user user in the database so we create one.
        @user = User.new
        @user.email = "george@example.com"
        @user.password = "curiousmonkey"
        @user.save!
        @location = Location.new
        @location.name = "Petco Park"
        @location.address = "100 Park Blvd"
        @location.city = "San Diego"
        @location.state = "CA"
        @location.zip = "92101"
        @location.save!
        visit '/'
        fill_in 'Email', with: 'george@example.com'
        fill_in 'Password', with: 'curiousmonkey'
        click_button 'Log in'
      end
      Then "I click the new activity button" do
        click_link "New Activity"
      end
      Then "I fill out the new activity form" do
        fill_in 'Name', with: 'Wind Sprints'
        fill_in 'Website', with: 'www.google.com'
        fill_in 'Description', with: 'Run fast'
        click_link "Add New Location"
        fill_in 'activity[location_attributes][address]', with: 'Learn'
        fill_in 'Address', with: '704 J Street'
        fill_in 'City', with: 'San Diego'
        fill_in 'State', with: 'CA'
        fill_in 'Zip', with: '92101'
        fill_in 'Schedule', with: 'M-F'
        fill_in 'Requirement', with: 'Shoes'
        fill_in 'Pricing', with: '$5'
        check('Terms of service')
        click_button 'Create Activity'
      end
      When "I click the back button to see home page" do
        click_link 'Back'
        expect(page).to have_content("Wind Sprints")
        expect(page).to have_content("Run fast")
        expect(page).to have_content("M-F")
      end
      Then "I click the new activity button" do
        click_link "New Activity"
        fill_in 'Name', with: 'Running'
        fill_in 'Website', with: 'www.running.com'
        fill_in 'Description', with: 'Run faster'
        select('Petco Park', :from => 'Location')
        fill_in 'Schedule', with: 'Sat 9am-10am'
        fill_in 'Requirement', with: 'Tights'
        fill_in 'Pricing', with: 'Free'
        check('Terms of service')
        click_button 'Create Activity'
      end
      When "I click the back button" do
        click_link 'Back To Home Page'
        expect(page).to have_content("Running")
        expect(page).to have_content("Run faster")
        expect(page).to have_content("Sat 9am-10am")
      end
    end
  end
end
