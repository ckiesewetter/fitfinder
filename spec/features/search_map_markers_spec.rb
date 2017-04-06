require 'rails_helper'

RSpec.feature "SearchMapMarkers", type: :feature do
  context "Search the activity index and have map adjust" do
    Steps "Searching the activities by distance or activity info" do
      Given "I am a signed in user, and there are activities and locations" do
        # Setting up user for the test
        user = User.create!(email: 'test@example.com', password: 'testing123')
        # Setting up locations for the the test to search
        location1 = Location.create!( "name"=>"Mission Bay Park",
                                    "address"=>"2688 East Mission Bay Drive",
                                    "city"=>"San Diego",
                                    "state"=>"CA",
                                    "zip"=>"92109",
                                    "latitude"=> 32.7897102,
                                    "longitude"=> -117.2099465)
        location2 = Location.create!( "name"=>"Learn Academy",
                                    "address"=>"704 J Street",
                                    "city"=>"San Diego",
                                    "state"=>"CA",
                                    "zip"=>"92101",
                                    "latitude"=> 32.7096298,
                                    "longitude"=> -117.1580141)
        location3 = Location.create!( "name"=>"Sunset Park",
                                    "address"=>"101 Ocean Blvd",
                                    "city"=>"Coronado",
                                    "state"=>"CA",
                                    "zip"=>"92118",
                                    "latitude"=> 32.6881828,
                                    "longitude"=> -117.1927911)

        # Setting up activities for the test to search
        Activity.create!(name: "Jazercize",
                        user: user,
                        website: 'http://google.com',
                        description: "This is the song that never ends, yes it goes on and on my friends, some people, started singining it not knowing what it was, but they'll just keeep on singing it forever just because this is the song that never ends, yes it goes on and on my friends, some people, started singining it not knowing what it was, but they'll just keeep on singing it forever",
                        next_at: 1.day.from_now,
                        schedule: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        location: location1)
        Activity.create!(name: "Yoga",
                        user: user,
                        website: 'http://google.com',
                        description: "This is the song that never ends, yes it goes on and on my friends, some people, started singining it not knowing what it was, but they'll just keeep on singing it forever just because this is the song that never ends, yes it goes on and on my friends, some people, started singining it not knowing what it was, but they'll just keeep on singing it forever",
                        next_at: 1.day.from_now,
                        schedule: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        location: location2)
        Activity.create!(name: "Swimming",
                        user: user,
                        website: 'http://google.com',
                        description: "This is the song that never ends, yes it goes on and on my friends, some people, started singining it not knowing what it was, but they'll just keeep on singing it forever just because this is the song that never ends, yes it goes on and on my friends, some people, started singining it not knowing what it was, but they'll just keeep on singing it forever",
                        next_at: 1.day.from_now,
                        schedule: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        location: location3)
        visit '/'
        fill_in 'Email', with: 'test@example.com'
        fill_in 'Password', with: 'testing123'
        click_button 'Log in'
      end
      Then "I will see a list of all activies with locations and search fields" do
        expect(page).to have_content("Jazercize")
        expect(page).to have_content("Mission Bay Park")
        expect(page).to have_content("Yoga")
        expect(page).to have_content("Learn Academy")
        expect(page).to have_content("Swimming")
        expect(page).to have_content("Sunset Park")
        expect(page).to have_content("Search Map by Distance")
        expect(page).to have_content("Or Search Map by Activity Information ")
      end
      When "I search the map by distance" do
        select '1', :from => 'distance'
        fill_in 'location', with: '704 J St'
        click_button 'Search By Distance'
      end
      Then "I would see a updated map and list of activities based on search criteria" do
        expect(page).not_to have_content("Jazercize")
        expect(page).not_to have_content("Mission Bay Park")
        expect(page).to have_content("Yoga")
        expect(page).to have_content("Learn Academy")
        expect(page).not_to have_content("Swimming")
        expect(page).not_to have_content("Sunset Park")
      end
      When "I search the map by activity info" do
        fill_in 'search', with: 'Swimming'
        click_button 'Search By Info'
      end
      Then "I would see an updated map and list of activities based on the search" do
        expect(page).not_to have_content("Jazercize")
        expect(page).not_to have_content("Mission Bay Park")
        expect(page).not_to have_content("Yoga")
        expect(page).not_to have_content("Learn Academy")
        expect(page).to have_content("Swimming")
        expect(page).to have_content("Sunset Park")
      end
    end
  end
end
