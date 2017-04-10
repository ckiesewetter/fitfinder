require 'rails_helper'

RSpec.feature "ActivityLayouts", type: :feature do
  context "Activies > Show Layout" do
    Steps "Layout of the Activities > Show page" do
      Given "I have an activity" do
        user = User.create!(email: 'test@example.com', password: 'testing123')
        location = Location.create!( "name"=>"Sunset Park",
                                    "address"=>"555 Sunset Blvd",
                                    "city"=>"Sunset",
                                    "state"=>"CA",
                                    "zip"=>"92104",
                                    "latitude"=>123.23,
                                    "longitude"=>31.22)
        Activity.create!(name: "Jazercize",
                        user: user,
                        website: 'http://google.com',
                        description: "This is the song that never ends, yes it goes on and on my friends, some people, started singining it not knowing what it was, but they'll just keeep on singing it forever just because this is the song that never ends, yes it goes on and on my friends, some people, started singining it not knowing what it was, but they'll just keeep on singing it forever",
                        next_at: 1.day.from_now,
                        schedule: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        location: location)
      end
      Given 'I click on the sign up link on the homepage and am brought to the sign up page' do
        visit '/users/sign_up'
      end
      When 'I fill in the form' do
        attach_file('user[image]', '/Users/learn/Downloads/illustration.jpg')
        fill_in 'First name', with: 'test'
        fill_in 'Last name', with: 'test2'
        fill_in 'Email', with: 'test@test.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
        click_button 'Sign up'
      end
      Then "I see a successful sign-in alert" do
        expect(page).to have_content("You have signed up successfully")
      end
      Given "I visit localhost:3000/activities" do
        visit "/activities"
      end
      Then "I see page title" do
        expect(page).to have_content("Welcome to FindFit")
      end
      When "I click the Show text link" do
        click_link 'Show'
      end
      Then "I can see content for the created Activity" do
        expect(page).to have_content("555 Sunset Blvd")
        expect(page).to have_content("Sunset")
        expect(page).to have_content("CA")
        expect(page).to have_content("Jazercize")
        expect(page).to have_content("http://google.com")
      end

      # capybara debugging command --> save_and_open_page
      # Then "I visit localhost:3000/activities/2" do
      #   visit '/activities/2'
      # end
      # Then "I can see the layout of the activity show page" do

      # end
    end
  end
end
