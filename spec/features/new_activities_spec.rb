require 'rails_helper'

RSpec.feature "NewActivities", type: :feature do
  context "Activities Page" do
    Steps "Going to Activities Page" do
      Given "I visit /activities" do
        visit "/activities"
      end
      Then "I see Activities" do
        expect(page).to have_content("Activities")
      end
      Then "I can create a new activity" do
        click_link 'New Activity'
      end
      Then "I am taken to a page that shows form fields" do
        expect(page).to have_content("New Activity")
        expect(page).to have_content("Name")
        expect(page).to have_content("User")
        expect(page).to have_content("Website")
      end
      Then "I can fill in form fields" do
        fill_in 'Name', with: 'Wind Sprints'
        # fill_in 'User', with: 'Nate Nasty'
        fill_in 'Website', with: 'www.google.com'
        fill_in 'Description', with: 'Run fast'
        # fill_in 'Location', with: '0'
        fill_in 'Schedule', with: 'M-F'
        click_button 'Create Activity'
      end
      Then 'I am taken to a page showing my new Activity' do
        expect(page).to have_content("Wind Sprints")
        # expect(page).to have_content("Nate Nasty")
        expect(page).to have_content("www.google.com")
        expect(page).to have_content("Run fast")
        expect(page).to have_content("M-F")
      end
    end
  end
end
