require 'rails_helper'

RSpec.feature "RemoveParticipations", type: :feature do
  Steps "Removing participation in an event" do
    Given "I have a location, user, and activity" do
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
      @activity = Activity.new
      @activity.name = "Kettle Bell Runs"
      @activity.website = "www.runwithbells.com"
      @activity.description = "Bells to the wall"
      @activity.location_id = @location.id
      @activity.schedule = "M-F 9a-10a"
      @activity.requirement = "More cow bell"
      @activity.pricing = "$50"
      @activity.save!
    end
    Then "I visit the landing page" do
      visit '/'
      fill_in 'Email', with: 'george@example.com'
      fill_in 'Password', with: 'curiousmonkey'
      click_button 'Log in'
    end
    When "I look at the landing page" do
      expect(page).to have_content("Sign Up")
    end
    Then "I sign up for the activity" do
      click_link "Sign Up"
    end
    Then "I go back to the landing page" do
      click_link "Back"
    end
    When "I check the landing page" do
      expect(page).to have_content("Remove")
    end
    Then "I can remove my participation from this event" do
      click_link "Remove"
    end
    When "I check the activity show page" do
      expect(page).to have_content("You have successfully removed your participation from this event!")
    end
    Then "I go back to the landing page" do
      click_link "Back"
      save_and_open_page
    end
    When "I check the landing page" do
      expect(page).to have_content("Sign Up")
    end
  end
end
