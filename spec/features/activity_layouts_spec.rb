require 'rails_helper'

RSpec.feature "ActivityLayouts", type: :feature do
  context "Activies > Show Layout" do
    Steps "Layout of the Activities > Show page" do
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

      Given "I visit localhost:3000/users/sign_in" do
        visit "Log in"
        expect(page).to have_content("Log in")
      end
      Then "I visit localhost:3000/activities" do
        visit "/activities"
      end
      Then "I can fill email and password" do
        fill_in 'Email', with: 'bsems@me.com'
        fill_in 'Password', with: 'password'
        click_link 'Sign up'
      end
      Then "I am taken to localhost:3000" do
        expect(page).to have_content("Signed in successfully")
      end
      Then "I see page title" do
        expect(page).to have_content("Welcome to FitFinder!")
      end
      Then "I click the Show text link" do
        click_link 'Show'
      end
      Then "I visit localhost:3000/activities/2" do
        visit '/activities/2'
      end
      Then "I can see the layout of the activity show page" do

      end
    end
  end
end
