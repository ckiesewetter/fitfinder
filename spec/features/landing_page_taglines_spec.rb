require 'rails_helper'

RSpec.feature "LandingPageTaglines", type: :feature do
  context 'Going to landing page' do
    Steps 'Being welcomed' do
      Given 'A user with email george@example.com and password curiousmonkey and I login' do
        create_user_and_sign_in
      end
      Then 'I can see a tagline and description' do
        expect(page).to have_content("Welcome to FitFinder!")
        expect(page).to have_content("A Fitness Group Connector")
        expect(page).to have_content("What is FitFinder?")
        expect(page).to have_content("FitFinder connects like-minded fitness enthusiasts by giving people the ability to create a fitness group or join an existing fitness group.")
      end
    end
  end
end
