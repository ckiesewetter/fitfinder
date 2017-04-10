require 'rails_helper'

RSpec.feature "NotSeeingParticipantLists", type: :feature do
  context "As an organizer, I can see a list of participants for my activity" do
    Steps "Viewing my activity and seeing participant list" do
      Given "I am a signed in user, and there is a created activity by me" do
        # Setting up user for the test
        @user1 = User.create!(email: 'test@example.com', password: 'testing123')
        @user2 = User.create!(email: 'test2@example.com', password: 'testing123')
        # Setting up locations for the the test to search
        @location1 = Location.create!( "name"=>"Mission Bay Park",
                                    "address"=>"2688 East Mission Bay Drive",
                                    "city"=>"San Diego",
                                    "state"=>"CA",
                                    "zip"=>"92109",
                                    "latitude"=> 32.7897102,
                                    "longitude"=> -117.2099465)

        # Setting up activities for the test to search
        @activity = Activity.create!(name: "Jazercize",
                        user: @user1,
                        website: 'http://google.com',
                        description: "This is the song that never ends, yes it goes on and on my friends, some people, started singining it not knowing what it was, but they'll just keeep on singing it forever just because this is the song that never ends, yes it goes on and on my friends, some people, started singining it not knowing what it was, but they'll just keeep on singing it forever",
                        next_at: 1.day.from_now,
                        schedule: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        location: @location1)
        Participation.create!(user_id: @user2.id,
                        activity_id: @activity.id)
        visit '/'
        fill_in 'Email', with: 'test2@example.com'
        fill_in 'Password', with: 'testing123'
        click_button 'Log in'
      end
      When "I view my created activity" do
        click_link "Show"
      end
      Then "I can see a list of particitpants" do
        expect(page).not_to have_content("Participants In Your Activity")
        expect(page).not_to have_content("test2@example.com")
      end
    end
  end
end
