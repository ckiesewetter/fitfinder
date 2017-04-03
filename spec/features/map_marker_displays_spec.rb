require 'rails_helper'

RSpec.feature "MapMarkerDisplays", type: :feature do
  context 'checking landing page for marker information' do
    Steps 'checking marker information' do
      Given "a logged in user" do
        create_user_and_sign_in
      end
      Given "I'm on the landing page" do
        visit '/'
        @location = Location.new(address: '2804 Lincoln Ave',
        city: 'San Diego',
        state: "CA",
        zip: '92104'
        )
        @location.save
      end
      Then 'I click New Acitivity link' do
        click_link 'New Activity'
      end
      Then "I can fill in form fields" do
        fill_in 'Name', with: 'Wind Sprints'
        fill_in 'User', with: 1
        fill_in 'Website', with: 'www.google.com'
        fill_in 'Description', with: 'Run fast'
        fill_in 'Location', with: @location.id
        fill_in 'Schedule', with: 'M-F'
        click_button 'Create Activity'
      end
      Then "I can go back to the Activities page" do
        click_link "Back"
        save_and_open_page
      end
      Then "I can see information on the Activities page" do
        expect(page).to have_content("Wind Sprints")
        expect(page).to have_content("www.google.com")
        expect(page).to have_content("Run fast")
      end
    end
  end
end
