require 'rails_helper'

RSpec.feature "ParticipantsLists", type: :feature do

      Steps "Seeing a list of activities I'm participating in" do
        Given 'An Activty' do
          @location = Location.new
          @location.name = "LEARN"
          @location.address = "704 J St."
          @location.city = "San Diego"
          @location.state = "CA"
          @location.zip = "92101"
          @location.save!
          @activity = Activity.new
          @activity.location_id = @location.id
          @activity.description = "Bowling"
          @activity.schedule = "San Diego"
          @activity.user_id = "9"
          @activity.name = "Rob"
          @activity.fitness_level = "beginner"
          @activity.website = "yahoo.com"
          @activity.pricing = "$5"
          @activity.save!
        end
        Given 'I click on the sign up link on the homepage and am brought to the sign up page' do
          visit '/users/sign_up'
        end
        Then 'I see a form to fill out' do
          expect(page).to have_content("Sign up")
          expect(page).to have_content("Attach avatar")
          expect(page).to have_content("First name")
          expect(page).to have_content("Last name")
          expect(page).to have_content("Email")
          expect(page).to have_content("Password")
          expect(page).to have_content("Password confirmation")
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
        Then 'I can see a link to sign up for an activity' do
        expect(page).to have_content("Welcome! You have signed up successfully.")
        expect(page).to have_content("FitFinder connects like-minded fitness enthusiasts by giving people the ability to create a fitness group or join an existing fitness group.")
        end
        When 'I click on a link I can Sign up for an activity' do
          visit '/'

          #actually clikc the sing up link
          # click 'Sign Up'
          click_link 'Sign Up'
        end
        Then 'I should have a new participation and that participation is for the correct activity' do
          expect(Participation.count).to eq(1)
        end
        And 'I should see a flash message telling me Ive signed up' do
          expect(page).to have_content("You have successfully signed up to the activity!")
        end
        Then 'I should see the word "Active" instead of "Sign Up"' do
          visit "/"
          expect(page).to have_content("Active")
          expect(page).to_not have_content("Sign Up")
        end
        When 'I click on the link Click To View My Activities' do
          click_button ("Click To View My Activities")
        end
        When 'I click on the link Click To View My Past Activities' do
          click_button ("Click To View My Past Activities")
        end
end
end
